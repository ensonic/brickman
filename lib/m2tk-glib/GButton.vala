/*
 * m2tk-glib -- GLib bindings for m2tklib graphical toolkit
 *
 * Copyright (C) 2014 David Lechner <david@lechnology.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * GButton.vala:
 *
 * wrapper for m2tk BUTTON
 */


namespace M2tk {
    public class GButton : M2tk.GElement {
        Button button { get { return (Button)element; } }

        string _text;
        public string text {
            get { return _text; }
            set {
                _text = value;
                button.text = _text;
                is_dirty = true;
            }
        }

        public signal void pressed(GButton button);

        public GButton(string text) {
            base(Button.create((ButtonFunc)on_button, text));
            this._text = text;
        }

        static void on_button(ElementFuncArgs arg) {
            var button = (GButton)element_map[arg.element];
            button.pressed(button);
        }
    }
}