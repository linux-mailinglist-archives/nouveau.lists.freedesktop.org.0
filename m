Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A1C01C4
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2019 11:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E17B6EEC1;
	Fri, 27 Sep 2019 09:07:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1E836EEC1
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 09:07:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AEEB172162; Fri, 27 Sep 2019 09:07:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 27 Sep 2019 09:07:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brianclinkenbeard@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111841-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111841] New: Setting gamma or color temperature on
 GK104 causes horizontal artifacts / flickering
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
Content-Type: multipart/mixed; boundary="===============1185700456=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1185700456==
Content-Type: multipart/alternative; boundary="15695752291.edff84.12755"
Content-Transfer-Encoding: 7bit


--15695752291.edff84.12755
Date: Fri, 27 Sep 2019 09:07:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111841

            Bug ID: 111841
           Summary: Setting gamma or color temperature on GK104 causes
                    horizontal artifacts / flickering
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: brianclinkenbeard@protonmail.com
        QA Contact: xorg-team@lists.x.org

Created attachment 145545
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145545&action=3Dedit
dmesg log

After setting the gamma or color temperature through various methods (redsh=
ift
-m randr, redshift -m drm, GNOME night shift on xorg or wayland) horizontal
artifacts begin to flicker. This does not severely obscure the screen but
appears as small lines horizontal lines flickering quickly. This notably do=
es
not happen using the "vidmode" method of redshift
(https://github.com/jonls/redshift/blob/master/src/gamma-vidmode.c). I've
tested this on multiple displays.

The effect is more noticeable on darker backgrounds.

Steps to reproduce:
1) Use GK104/NVE0 on Xorg or Wayland.
2) Try to adjust color temperature or gamma with software such as redshift =
(-m
randr or drm).

I've attached the dmesg log, note that I am not certain the gnome-shell
segfaults have anything to do with this issue.

Kernel:
Linux desktop 5.2.0-2-amd64 #1 SMP Debian 5.2.9-2 (2019-08-21) x86_64 GNU/L=
inux

Card:
NVIDIA Corporation GK104 [GeForce GTX 770]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695752291.edff84.12755
Date: Fri, 27 Sep 2019 09:07:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Setting gamma or color temperature on GK104 causes horizo=
ntal artifacts / flickering"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111841">111841</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Setting gamma or color temperature on GK104 causes horizontal=
 artifacts / flickering
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>brianclinkenbeard&#64;protonmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145545=
" name=3D"attach_145545" title=3D"dmesg log">attachment 145545</a> <a href=
=3D"attachment.cgi?id=3D145545&amp;action=3Dedit" title=3D"dmesg log">[deta=
ils]</a></span>
dmesg log

After setting the gamma or color temperature through various methods (redsh=
ift
-m randr, redshift -m drm, GNOME night shift on xorg or wayland) horizontal
artifacts begin to flicker. This does not severely obscure the screen but
appears as small lines horizontal lines flickering quickly. This notably do=
es
not happen using the &quot;vidmode&quot; method of redshift
(<a href=3D"https://github.com/jonls/redshift/blob/master/src/gamma-vidmode=
.c">https://github.com/jonls/redshift/blob/master/src/gamma-vidmode.c</a>).=
 I've
tested this on multiple displays.

The effect is more noticeable on darker backgrounds.

Steps to reproduce:
1) Use GK104/NVE0 on Xorg or Wayland.
2) Try to adjust color temperature or gamma with software such as redshift =
(-m
randr or drm).

I've attached the dmesg log, note that I am not certain the gnome-shell
segfaults have anything to do with this issue.

Kernel:
Linux desktop 5.2.0-2-amd64 #1 SMP Debian 5.2.9-2 (2019-08-21) x86_64 GNU/L=
inux

Card:
NVIDIA Corporation GK104 [GeForce GTX 770]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695752291.edff84.12755--

--===============1185700456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1185700456==--
