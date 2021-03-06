package com.flair.server.utilities;

import gnu.trove.map.TIntDoubleMap;
import gnu.trove.map.hash.TIntDoubleHashMap;

import java.util.Arrays;

/*
 * A very basic implementation of a sparse array/vector of double precision floating point values
 */
public class SparseDoubleVector {
	private final TIntDoubleMap backingStore;
	private final int length;
	private boolean normalized;

	public SparseDoubleVector(int length) {
		this.backingStore = new TIntDoubleHashMap();
		this.length = length;
		this.normalized = true;
	}

	public double get(int index) {
		if (index >= length)
			throw new IndexOutOfBoundsException("Index " + index + " must be less than " + length);

		double val = backingStore.get(index);
		if (val == backingStore.getNoEntryValue())
			return 0;
		else
			return val;
	}

	public void set(int index, double val) {
		if (index >= length)
			throw new IndexOutOfBoundsException("Index " + index + " must be less than " + length);

		backingStore.put(index, val);
		normalized = false;
	}

	public boolean isZero(int index) {
		if (index >= length)
			throw new IndexOutOfBoundsException("Index " + index + " must be less than " + length);

		return !backingStore.containsKey(index);
	}

	public double dot(SparseDoubleVector rhs) {
		if (length != rhs.length)
			throw new IllegalArgumentException("Mismatching sparse vector lengths");

		double out = 0;
		for (int i = 0; i < length; ++i) {
			if (isZero(i) || rhs.isZero(i))
				continue;
			out += get(i) * rhs.get(i);
		}
		return out;
	}

	public double magnitude() {
		double out = 0;
		for (double itr : backingStore.values())
			out += itr * itr;
		return Math.sqrt(out);
	}

	public void normalize() {
		double magnitude = magnitude();
		Arrays.stream(backingStore.keys()).forEach(k -> backingStore.put(k, magnitude * backingStore.get(k)));
		normalized = true;
	}

	public boolean isNormalized() {
		return normalized;
	}
}
