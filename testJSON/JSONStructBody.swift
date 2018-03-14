//
//  JSONStructBody.swift
//  testJSON
//
//  Created by Zaur Giyasov on 14/03/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import Foundation

// https://api.tinkoff.ru/v1/news_content?id=2143

/*
 {
 resultCode: "OK",
 payload: {
 title: {
 id: "2143",
 name: "10062014-google-play",
 text: "ТКС Банк и&amp;nbsp;Google Play вернут владельцам карты Tinkoff Platinum&amp;nbsp;25% в&amp;nbsp;баллах от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play",
 publicationDate: {
 milliseconds: 1402401702000
 },
 bankInfoTypeId: 2
 },
 creationDate: {
 milliseconds: 1402390653000
 },
 lastModificationDate: {
 milliseconds: 1402390653000
 },
 content: "&lt;p&gt;&lt;strong&gt;&lt;em&gt;Москва, Россия&amp;nbsp;&amp;mdash; 10&amp;nbsp;июня 2014&amp;nbsp;г.&lt;/em&gt;&lt;/strong&gt; С&amp;nbsp;9&amp;nbsp;июня по&amp;nbsp;31&amp;nbsp;августа 2014 года банк &amp;laquo;Тинькофф Кредитные Системы&amp;raquo; совместно с&amp;nbsp;онлайн-магазином приложений и&amp;nbsp;цифрового контента компании Google&amp;nbsp;&amp;mdash; Google Play&amp;nbsp;&amp;mdash; проводит специальную акцию, в&amp;nbsp;рамках которой&amp;nbsp;25% от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play возвращаются в&amp;nbsp;баллах всем владельцам кредитной карты Tinkoff Platinum.&lt;/p&gt;\n&lt;p&gt;Каждый держатель кредитной карты Tinkoff Platinum, участник программы лояльности &amp;laquo;Браво&amp;raquo;, получит&amp;nbsp;25% от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play в&amp;nbsp;баллах. Накопленные баллы &amp;laquo;Браво&amp;raquo; можно обменять на&amp;nbsp;бесплатный контент в&amp;nbsp;магазине приложений Google Play, предлагающий более миллиона увлекательных игр и&amp;nbsp;приложений для владельцев устройств с&amp;nbsp;операционной системой Android, а&amp;nbsp;также миллионы музыкальных треков и&amp;nbsp;обширную коллекцию книг и&amp;nbsp;художественных фильмов. Компенсировать покупки за&amp;nbsp;счет баллов можно напрямую из&amp;nbsp;интернет-банка и/или мобильного приложения банка &amp;laquo;Тинькофф Кредитные Системы&amp;raquo;.&lt;/p&gt;\n&lt;p&gt;В&amp;nbsp;акции могут принять участие держатели кредитных карт Tinkoff Platinum, а&amp;nbsp;также клиенты, впервые заказавшие себе такую карту в&amp;nbsp;ТКС Банке в&amp;nbsp;период акции.&lt;/p&gt;",
 bankInfoTypeId: 2,
 typeId: "usual"
 },
 trackingId: "63741028867"
 }
 */

struct BodyNews: Decodable {
    //"resultCode":"OK",
    //"trackingId":"58479826241"
    //"payload": {}
    var resultCode: String = ""
    var trackingId: String = ""
    var payload: BodyPayloads
}

struct BodyPayloads: Decodable {
    //    payload: {
    //    title: {
    //    id: "2143",
    //    name: "10062014-google-play",
    //    text: "ТКС Банк и&amp;nbsp;Google Play вернут владельцам карты Tinkoff Platinum&amp;nbsp;25% в&amp;nbsp;баллах от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play",
    //    publicationDate: {
    //    milliseconds: 1402401702000
    //    },
    //    bankInfoTypeId: 2
    //    },
    //    creationDate: {
    //    milliseconds: 1402390653000
    //    },
    //    lastModificationDate: {
    //    milliseconds: 1402390653000
    //    },
    //    content: "&lt;p&gt;&lt;strong&gt;&lt;em&gt;Москва, Россия&amp;nbsp;&amp;mdash; 10&amp;nbsp;июня 2014&amp;nbsp;г.&lt;/em&gt;&lt;/strong&gt; С&amp;nbsp;9&amp;nbsp;июня по&amp;nbsp;31&amp;nbsp;августа 2014 года банк &amp;laquo;Тинькофф Кредитные Системы&amp;raquo; совместно с&amp;nbsp;онлайн-магазином приложений и&amp;nbsp;цифрового контента компании Google&amp;nbsp;&amp;mdash; Google Play&amp;nbsp;&amp;mdash; проводит специальную акцию, в&amp;nbsp;рамках которой&amp;nbsp;25% от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play возвращаются в&amp;nbsp;баллах всем владельцам кредитной карты Tinkoff Platinum.&lt;/p&gt;\n&lt;p&gt;Каждый держатель кредитной карты Tinkoff Platinum, участник программы лояльности &amp;laquo;Браво&amp;raquo;, получит&amp;nbsp;25% от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play в&amp;nbsp;баллах. Накопленные баллы &amp;laquo;Браво&amp;raquo; можно обменять на&amp;nbsp;бесплатный контент в&amp;nbsp;магазине приложений Google Play, предлагающий более миллиона увлекательных игр и&amp;nbsp;приложений для владельцев устройств с&amp;nbsp;операционной системой Android, а&amp;nbsp;также миллионы музыкальных треков и&amp;nbsp;обширную коллекцию книг и&amp;nbsp;художественных фильмов. Компенсировать покупки за&amp;nbsp;счет баллов можно напрямую из&amp;nbsp;интернет-банка и/или мобильного приложения банка &amp;laquo;Тинькофф Кредитные Системы&amp;raquo;.&lt;/p&gt;\n&lt;p&gt;В&amp;nbsp;акции могут принять участие держатели кредитных карт Tinkoff Platinum, а&amp;nbsp;также клиенты, впервые заказавшие себе такую карту в&amp;nbsp;ТКС Банке в&amp;nbsp;период акции.&lt;/p&gt;",
    //    bankInfoTypeId: 2,
    //    typeId: "usual"
    //    },
    var title: BodyTitle
    var creationDate: DateInMilliseconds
    var lastModificationDate: DateInMilliseconds
    var content: String = ""
    var bankInfoTypeId: Int = 1
    var typeId: String = ""
}

struct BodyTitle: Decodable {
    /*
     id: "2143",
     name: "10062014-google-play",
     text: "ТКС Банк и&amp;nbsp;Google Play вернут владельцам карты Tinkoff Platinum&amp;nbsp;25% в&amp;nbsp;баллах от&amp;nbsp;суммы покупок в&amp;nbsp;Google Play",
     publicationDate: {
     milliseconds: 1402401702000
     },
     bankInfoTypeId: 2
     },
     */
    var id: String = ""
    var name: String = ""
    var text: String = ""
    var publicationDate: DateInMilliseconds
    var bankInfoTypeId: Int = 1
}







