/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

    config.language = 'vi';
    config.entities_latin = false;

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
        { name: 'clipboard', groups: ['clipboard', 'undo'] },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
        { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
        { name: 'links', groups: ['links'] },
        { name: 'insert', groups: ['insert'] },
        { name: 'forms', groups: ['forms'] },
        { name: 'tools', groups: ['tools'] },
        { name: 'document', groups: ['mode', 'document', 'doctools'] },
        { name: 'others', groups: ['others'] },
        '/',
        { name: 'styles', groups: ['styles'] },
        { name: 'colors', groups: ['colors'] },
        { name: 'about', groups: ['about'] }
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
    config.removeDialogTabs = 'image:advanced;link:advanced';

    config.removeButtons = 'Underline,Subscript,Superscript,Blockquote,About,Styles,Format,Table,HorizontalRule,SpecialChar,Maximize,Cut,Copy,Paste,PasteText,PasteFromWord,Scayt';

    config.syntaxhighlight_lang = 'csharp';
    config.height = 400;
    config.syntaxhighlight_hideControls = true;
    config.filebrowserBrowseUrl = '../Admin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '../Admin/ckfinder/ckfinder.html?Types=Images';
    config.filebrowserUploadUrl = '../Admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=File';
    CKFinder.setupCKEditor(null, '../Admin/ckfinder/');
};
