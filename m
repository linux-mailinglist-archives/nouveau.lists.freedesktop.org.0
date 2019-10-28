Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4630E6FA8
	for <lists+nouveau@lfdr.de>; Mon, 28 Oct 2019 11:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19A36E55C;
	Mon, 28 Oct 2019 10:31:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19E906E554
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 10:31:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 17115720E2; Mon, 28 Oct 2019 10:31:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 28 Oct 2019 10:31:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: dooby.dave@virgin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112070-8800-Y5fWNT593P@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112070-8800@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0599436063=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0599436063==
Content-Type: multipart/alternative; boundary="15722586950.Cc1f5c.933"
Content-Transfer-Encoding: 7bit


--15722586950.Cc1f5c.933
Date: Mon, 28 Oct 2019 10:31:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #32 from Doobz <dooby.dave@virgin.net> ---
..and the acpi ones with acpi_mask_gre=3D0x19. There's a bunch of other one=
's to
try when I'm bored.. :)

Back to the 360 degree vid thing, On a fresh boot into debian, the mess com=
ing
out of Firefox included the bottom half of what appeared to be a suse
filebrowser window I had open the day before!

I only just remembered to look in .xsession.errors. It is indeed logged the=
re
along with some others.

Cleaned up .xsessions from fresh suse tumbleweed on NV63 :-

/usr/bin/iceauth:  creating new authority file /run/user/1000/ICEauthority

(xfce4-session:1436): xfce4-session-WARNING **: 09:47:57.705:
xfsm_manager_load_session: Something wrong with
/home/doobz/.cache/sessions/xfce4-session-debian:0, Does it exist? Permissi=
ons
issue?
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used
** Message: 09:47:57.797: couldn't access control socket:
/run/user/1000/keyring/control: No such file or directory

(xfsettingsd:1522): xfsettingsd-WARNING **: 09:48:05.059: Property
"/Gdk/WindowScalingFactor" has an unsupported type "guint".

** (wrapper-2.0:1545): WARNING **: 09:48:06.348: No outputs have backlight
property

(wrapper-2.0:1550): GLib-GIO-CRITICAL **: 09:48:06.704: g_file_new_for_path:
assertion 'path !=3D NULL' failed

(wrapper-2.0:1550): GLib-GIO-CRITICAL **: 09:48:06.704: g_file_monitor_file:
assertion 'G_IS_FILE (file)' failed

(wrapper-2.0:1550): GLib-GObject-WARNING **: 09:48:06.704: invalid (NULL)
pointer instance

(wrapper-2.0:1550): GLib-GObject-CRITICAL **: 09:48:06.705:
g_signal_connect_data: assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed

(wrapper-2.0:1550): Gtk-WARNING **: 09:48:06.705: Attempting to add a widget
with type GtkToggleButton to a container of type XfcePanelPlugin, but the
widget is already inside a container of type XfcePanelPlugin, please remove=
 the
widget from its existing container first.
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used

(wrapper-2.0:1543): Gtk-WARNING **: 09:48:16.508: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
GtkToggleButton)

(wrapper-2.0:1545): Gtk-WARNING **: 09:48:16.801: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
PowerManagerButton)

(wrapper-2.0:1544): Gtk-WARNING **: 09:48:16.810: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
PulseaudioButton)

(wrapper-2.0:1550): Gtk-WARNING **: 09:48:16.822: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
GtkToggleButton)
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used
[Child 2152, MediaDecoderStateMachine #1] WARNING: Decoder=3D7f3103930800 D=
ecode
error: NS_ERROR_DOM_MEDIA_FATAL_ERR (0x806e0005) -
RefPtr<mozilla::MozPromise<RefPtr<mozilla::MediaTrackDemuxer::SamplesHolder=
>,
mozilla::MediaResult, true> >
mozilla::MediaSourceTrackDemuxer::DoGetSamples(int32_t): manager is detache=
d.:
file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/dom/media/MediaDecoderStateMachi=
ne.cpp,
line 3309
[Child 2152, MediaDecoderStateMachine #1] WARNING: Decoder=3D7f310IA_FATAL_=
ERR
(0x806e0005) -
RefPtr<mozilla::MozPromise<RefPtr<mozilla::MediaTrackDemuxer::SamplesHolder=
>,
mozilla::MediaResult, true> >
mozilla::MediaSourceTrackDemuxer::DoGetSamples(int32_t): manager is detache=
d.:
file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/dom/media/MediaDecoderStateMachi=
ne.cpp,
line 3309

[Parent 1979, Gecko_IOThread] WARNING: pipe error (61): Connection reset by
peer: file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/ipc/chromium/src/chrome/common/i=
pc_channel_posix.cc,
line 358
Invalid MIT-MAGIC-COOKIE-1 keyInvalid MIT-MAGIC-COOKIE-1 key

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722586950.Cc1f5c.933
Date: Mon, 28 Oct 2019 10:31:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>..and the acpi ones with acpi_mask_gre=3D0x19. There's a bunch=
 of other one's to
try when I'm bored.. :)

Back to the 360 degree vid thing, On a fresh boot into debian, the mess com=
ing
out of Firefox included the bottom half of what appeared to be a suse
filebrowser window I had open the day before!

I only just remembered to look in .xsession.errors. It is indeed logged the=
re
along with some others.

Cleaned up .xsessions from fresh suse tumbleweed on NV63 :-

/usr/bin/iceauth:  creating new authority file /run/user/1000/ICEauthority

(xfce4-session:1436): xfce4-session-WARNING **: 09:47:57.705:
xfsm_manager_load_session: Something wrong with
/home/doobz/.cache/sessions/xfce4-session-debian:0, Does it exist? Permissi=
ons
issue?
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used
** Message: 09:47:57.797: couldn't access control socket:
/run/user/1000/keyring/control: No such file or directory

(xfsettingsd:1522): xfsettingsd-WARNING **: 09:48:05.059: Property
&quot;/Gdk/WindowScalingFactor&quot; has an unsupported type &quot;guint&qu=
ot;.

** (wrapper-2.0:1545): WARNING **: 09:48:06.348: No outputs have backlight
property

(wrapper-2.0:1550): GLib-GIO-CRITICAL **: 09:48:06.704: g_file_new_for_path:
assertion 'path !=3D NULL' failed

(wrapper-2.0:1550): GLib-GIO-CRITICAL **: 09:48:06.704: g_file_monitor_file:
assertion 'G_IS_FILE (file)' failed

(wrapper-2.0:1550): GLib-GObject-WARNING **: 09:48:06.704: invalid (NULL)
pointer instance

(wrapper-2.0:1550): GLib-GObject-CRITICAL **: 09:48:06.705:
g_signal_connect_data: assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed

(wrapper-2.0:1550): Gtk-WARNING **: 09:48:06.705: Attempting to add a widget
with type GtkToggleButton to a container of type XfcePanelPlugin, but the
widget is already inside a container of type XfcePanelPlugin, please remove=
 the
widget from its existing container first.
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used

(wrapper-2.0:1543): Gtk-WARNING **: 09:48:16.508: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
GtkToggleButton)

(wrapper-2.0:1545): Gtk-WARNING **: 09:48:16.801: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
PowerManagerButton)

(wrapper-2.0:1544): Gtk-WARNING **: 09:48:16.810: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
PulseaudioButton)

(wrapper-2.0:1550): Gtk-WARNING **: 09:48:16.822: Negative content width -3
(allocation 1, extents 2x2) while allocating gadget (node button, owner
GtkToggleButton)
gnome-keyring-daemon: insufficient process capabilities, insecure memory mi=
ght
get used
[Child 2152, MediaDecoderStateMachine #1] WARNING: Decoder=3D7f3103930800 D=
ecode
error: NS_ERROR_DOM_MEDIA_FATAL_ERR (0x806e0005) -
RefPtr&lt;mozilla::MozPromise&lt;RefPtr&lt;mozilla::MediaTrackDemuxer::Samp=
lesHolder&gt;,
mozilla::MediaResult, true&gt; &gt;
mozilla::MediaSourceTrackDemuxer::DoGetSamples(int32_t): manager is detache=
d.:
file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/dom/media/MediaDecoderStateMachi=
ne.cpp,
line 3309
[Child 2152, MediaDecoderStateMachine #1] WARNING: Decoder=3D7f310IA_FATAL_=
ERR
(0x806e0005) -
RefPtr&lt;mozilla::MozPromise&lt;RefPtr&lt;mozilla::MediaTrackDemuxer::Samp=
lesHolder&gt;,
mozilla::MediaResult, true&gt; &gt;
mozilla::MediaSourceTrackDemuxer::DoGetSamples(int32_t): manager is detache=
d.:
file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/dom/media/MediaDecoderStateMachi=
ne.cpp,
line 3309

[Parent 1979, Gecko_IOThread] WARNING: pipe error (61): Connection reset by
peer: file
/home/abuild/rpmbuild/BUILD/firefox-69.0.3/ipc/chromium/src/chrome/common/i=
pc_channel_posix.cc,
line 358
Invalid MIT-MAGIC-COOKIE-1 keyInvalid MIT-MAGIC-COOKIE-1 key</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722586950.Cc1f5c.933--

--===============0599436063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0599436063==--
