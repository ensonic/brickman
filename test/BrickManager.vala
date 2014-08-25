/*
 * brickman -- Brick Manager for LEGO Mindstorms EV3/ev3dev
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
 * BrickManager.vala:
 *
 * Version of Brick Manager that runs in GTK for testing.
 */

using Gtk;

namespace BrickManager {

    static int main (string[] args)
    {
        Gtk.init (ref args);

        var main_window = new Window ();
        main_window.title = "Brick Manager Test";
        main_window.window_position = WindowPosition.CENTER;
        main_window.destroy.connect (Gtk.main_quit);

        var gui = new GUI ();
        main_window.add (gui.lcd);
        main_window.window_state_event.connect ((e) => {
            if (e.new_window_state == Gdk.WindowState.FOCUSED)
                Gtk.grab_add (gui.lcd);
            else
                Gtk.grab_remove (gui.lcd);
            return false;
        });
        main_window.realize.connect((e) => {
                int x;
                int y;
                int width;
                int height;
                main_window.get_position (out x, out y);
                main_window.get_size (out width, out height);
                gui.control_panel.move (x + width + 20, y);
            });
        main_window.show_all ();

        Gtk.main ();
        return 0;
    }
}