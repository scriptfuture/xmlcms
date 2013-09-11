<?
/**
 * XMLCMS v1.0
 * site: Fx-future.ru
 * license: MIT License http://www.opensource.org/licenses/mit-license.php  
 */

// Вывод кода HTML в виде текста
header('Content-Type: text/html;');

// Объект исходного XML-документа
$xml = new DOMDocument(null, 'UTF-8');
$xml->load('data/home.xml');

// Объект стиля
$xsl = new DOMDocument(null, 'UTF-8');
$xsl->load('themes/default/main.xsl');

// Создание парсера
$proc = new XSLTProcessor();

// Подключение стиля к парсеру
$proc->importStylesheet($xsl);

// Обработка парсером исходного XML-документа
$parsed = $proc->transformToXml($xml);

// Вывод результирующего кода
echo $parsed;

?>