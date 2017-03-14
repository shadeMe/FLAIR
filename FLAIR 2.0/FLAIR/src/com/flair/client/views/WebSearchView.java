package com.flair.client.views;

import org.gwtbootstrap3.client.ui.TextBox;
import org.gwtbootstrap3.extras.select.client.ui.Option;
import org.gwtbootstrap3.extras.select.client.ui.Select;

import com.flair.client.ClientEndPoint;
import com.flair.client.WebRankerCore;
import com.flair.client.localization.LocalizedComposite;
import com.flair.client.localization.SimpleLocalizedTextWidget;
import com.flair.client.localization.SimpleLocalizedWidget;
import com.flair.client.localization.locale.WebSearchViewLocale;
import com.flair.client.localization.SimpleLocale;
import com.flair.shared.grammar.Language;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiConstructor;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.ScrollPanel;
import com.google.gwt.user.client.ui.Widget;

public class WebSearchView extends LocalizedComposite
{
	private static WebSearchViewUiBinder uiBinder = GWT.create(WebSearchViewUiBinder.class);

	interface WebSearchViewUiBinder extends UiBinder<Widget, WebSearchView> {
	}

	@UiField
	TextBox								txtSearchBoxUI;
	SimpleLocalizedWidget<TextBox>		txtSearchBoxLC;
	@UiField
	Select								selResultCountUI;
	@UiField
	Option								selResultCountItm10UI;
	SimpleLocalizedTextWidget<Option>	selResultCountItm10LC;
	@UiField
	Option								selResultCountItm20UI;
	SimpleLocalizedTextWidget<Option>	selResultCountItm20LC;
	@UiField
	Option								selResultCountItm30UI;
	SimpleLocalizedTextWidget<Option>	selResultCountItm30LC;
	@UiField
	Option								selResultCountItm40UI;
	SimpleLocalizedTextWidget<Option>	selResultCountItm40LC;
	@UiField
	Option								selResultCountItm50UI;
	SimpleLocalizedTextWidget<Option>	selResultCountItm50LC;
	@UiField
	Select								selResultLangUI;
	@UiField
	Option								selResultLangItmEnUI;
	SimpleLocalizedTextWidget<Option>	selResultLangItmEnLC;
	@UiField
	Option								selResultLangItmDeUI;
	SimpleLocalizedTextWidget<Option>	selResultLangItmDeLC;
	@UiField
	ScrollPanel							pnlRankerContainerUI;
	
	WebRankerCore						webranker;
	
	private void initLocale()
	{	
		txtSearchBoxLC = new SimpleLocalizedWidget<>(txtSearchBoxUI, WebSearchViewLocale.DESC_txtSearchBoxUI, (w, t) -> {
			w.setPlaceholder(t);
		});
		selResultCountItm10LC = new SimpleLocalizedTextWidget<>(selResultCountItm10UI, WebSearchViewLocale.DESC_selResultCountItm10UI);
		selResultCountItm20LC = new SimpleLocalizedTextWidget<>(selResultCountItm20UI, WebSearchViewLocale.DESC_selResultCountItm20UI);
		selResultCountItm30LC = new SimpleLocalizedTextWidget<>(selResultCountItm30UI, WebSearchViewLocale.DESC_selResultCountItm30UI);
		selResultCountItm40LC = new SimpleLocalizedTextWidget<>(selResultCountItm40UI, WebSearchViewLocale.DESC_selResultCountItm40UI);
		selResultCountItm50LC = new SimpleLocalizedTextWidget<>(selResultCountItm50UI, WebSearchViewLocale.DESC_selResultCountItm50UI);
		selResultLangItmEnLC = new SimpleLocalizedTextWidget<>(selResultLangItmEnUI, WebSearchViewLocale.DESC_selResultLangItmEnUI);
		selResultLangItmDeLC = new SimpleLocalizedTextWidget<>(selResultLangItmDeUI, WebSearchViewLocale.DESC_selResultLangItmDeUI);
		
		registerLocale(WebSearchViewLocale.INSTANCE.en);
		registerLocale(WebSearchViewLocale.INSTANCE.de);
		
		registerLocalizedWidget(txtSearchBoxLC);
		registerLocalizedWidget(selResultCountItm10LC);
		registerLocalizedWidget(selResultCountItm20LC);
		registerLocalizedWidget(selResultCountItm30LC);
		registerLocalizedWidget(selResultCountItm40LC);
		registerLocalizedWidget(selResultCountItm50LC);
		registerLocalizedWidget(selResultLangItmEnLC);
		registerLocalizedWidget(selResultLangItmDeLC);
		
		refreshLocalization();
	}
	
	private void initHandlers()
	{
		txtSearchBoxUI.addKeyDownHandler(e -> {
			if (e.getNativeKeyCode() == KeyCodes.KEY_ENTER)
				invokeSearch();
		});
	}
	
	private void initUI()
	{
		// set the default search lang according to the global lang
		switch (localeCore.getLanguage())
		{
		case ENGLISH:
			selResultLangItmEnUI.setSelected(true);
			break;
		case GERMAN:
			selResultLangItmDeUI.setSelected(true);
			break;
		}
		
		// attach the ranker view
//		pnlRankerContainerUI.add(webranker.getView());
		pnlRankerContainerUI.add(new RankerView());
	}
	
	private void invokeSearch()
	{
		int resultCount = Integer.parseInt(selResultCountUI.getSelectedItem().getValue());
		Language searchLang = Language.fromString(selResultLangUI.getSelectedItem().getValue());
		String query = txtSearchBoxUI.getText();
		
		webranker.performSearch(query, resultCount, searchLang);
	}
	
	@UiConstructor
	public WebSearchView(WebRankerCore webranker) 
	{
		super(ClientEndPoint.get().getLocalization());
		initWidget(uiBinder.createAndBindUi(this));
		
		this.webranker = webranker;
		
		initLocale();
		initHandlers();
		initUI();
	}
	
	@Override
	public void setLocalization(Language lang)
	{
		super.setLocalization(lang);
		
		// force update select widgets
		selResultCountUI.refresh();
		selResultLangUI.refresh();
	}
}