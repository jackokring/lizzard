module main

import os
import veb

pub struct Context {
	veb.Context
}

pub struct App {
	veb.StaticHandler
}

pub fn (app &App) index() veb.Result {
	title := 'lizzard'
	message := 'Your new V web app is powered by veb.'
	return $veb.html()
}

@['/api'; get]
pub fn (app &App) api(mut ctx Context) veb.Result {
	return ctx.text('ok')
}

fn main() {
	// Keep asset and template paths stable for `v run .`.
	os.chdir(os.dir(@FILE))!
	mut app := &App{}
	app.static_mime_types['.less'] = 'text/css'
	app.handle_static('assets', false)!
	// serve PWA
	app.serve_static('/worker.js', 'pwa/worker.js')!
	veb.run[App, Context](mut app, 8080)
}
