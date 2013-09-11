/**
 * XMLCMS v1.0
 * site: Fx-future.ru
 * license: MIT License http://www.opensource.org/licenses/mit-license.php  
 */

// создаём  Ember-приложение
App = Ember.Application.create({
    ready: function () {

        // выделение активной ссылки меню
        $(".nav li").click(function () {

            $(".nav li").each(function (index, val) {
                if ($(this).hasClass("active")) $(this).removeClass("active");
            });

            $(this).addClass("active");
        });

    }
});

/*-- Страницы с информацией --*/
// Главная страница
App.IndexRoute = Ember.Route.extend({
    renderTemplate: function () {
        this.render();
    }
});


// О компании
App.AboutRoute = Ember.Route.extend({
    setupController: function (controller, model) {

        var url = "data/about.xml";

        $.ajax({
            type: "GET",
            dataType: "xml",
            url: url,
            beforeSend: function () {
                $("#loader").show();
            },
            success: function (xml) {
                $("#loader").hide();

                controller.set('title', $(xml).find("title").text());
                controller.set('text', $(xml).find("text").html());
            }
        });
    },
    renderTemplate: function () {
        this.render('global-page');
    }
});

// Контакты
App.ContactRoute = Ember.Route.extend({
    setupController: function (controller, model) {

        var url = "data/contact.xml";

        $.ajax({
            type: "GET",
            dataType: "xml",
            url: url,
            beforeSend: function () {
                $("#loader").show();
            },
            success: function (xml) {
                $("#loader").hide();

                controller.set('title', $(xml).find("title").text());
                controller.set('text', $(xml).find("text").html());
            }
        });
    },
    renderTemplate: function () {
        this.render('global-page');
    }
});

/*-- Новости --*/
App.BulletinController = Em.ObjectController.extend({
    content: null,
    title: null,
    text: null,
    date: null
});

App.BulletinRoute = Ember.Route.extend({
    setupController: function (controller, model) {

        var url = "data/news/item" + model.id + ".xml";

        // очищаем шаблон перез загрузкой данных
        controller.set('title', '');
        controller.set('date', '');
        controller.set('text', 'загрузка...');


        $.ajax({
            type: "GET",
            dataType: "xml",
            url: url,
            beforeSend: function () {
                $("#loader").show();
            },
            success: function (xml) {
                $("#loader").hide();

                var title = $(xml).find("title").text();
                var date = $(xml).find("date").text();
                var text = $(xml).find("text").text();

                controller.set('title', $(xml).find("title").text());
                controller.set('date', $(xml).find("date").text());
                controller.set('text', $(xml).find("text").html());
            }
        });


    },
    renderTemplate: function () {
        this.render();
    }
});


App.BulletinsRoute = Ember.Route.extend({
    model: function () {
        return App.Bulletin.all();
    }
});

App.Bulletin = Ember.Object.extend({
    id: null,
    title: null,
    date: null,
    text: null
});

App.Bulletin.reopenClass({
    allBulletins: [],
    all: function () {
        this.allBulletins = [];

        var that = this;

        var url = "data/news.xml";

        $.ajax({
            type: "GET",
            dataType: "xml",
            context: this,
            url: url,
            beforeSend: function () {
                $("#loader").show();
            },
            success: function (xml) {
                $("#loader").hide();

                $(xml).find("item").each(function (index) {

                    var title = $(this).find("title").text();
                    var date = $(this).find("date").text();
                    var preview = $(this).find("preview").text();
                    var id = $(this).attr("id");

                    var newsItem = App.Bulletin.create({
                        id: id,
                        title: title,
                        date: date,
                        preview: preview
                    });

                    that.allBulletins.pushObject(newsItem);

                });

            }
        });
        return this.allBulletins;
    }
});



/*--- Карта роутера ---*/
App.Router.map(function () {

    this.resource('about', {
        path: '/about'
    });
    this.resource('contact', {
        path: '/contact'
    });
    this.route('bulletins');
    this.route('bulletin', {
        path: '/bulletins/:bulletin_id'
    });

});