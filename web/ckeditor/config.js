/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html
	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'undo', 'clipboard' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'colors', groups: [ 'colors' ] }
	];
	config.language = 'ko';
	config.fillEmptyBlocks = true;

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Copy,Paste,PasteText,PasteFromWord,Link,Unlink,Anchor,Image,HorizontalRule,Source,Strike,Indent,Outdent,About,NumberedList,BulletedList,Styles,Cut,Scayt,Blockquote';

	config.autoParagraph = true;
	/*// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';*/
/*	config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre;address;div';*/
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.entities = false;
};
