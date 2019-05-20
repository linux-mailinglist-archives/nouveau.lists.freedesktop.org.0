Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D170122F18
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2019 10:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CEE89336;
	Mon, 20 May 2019 08:38:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 770A089336
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2019 08:38:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 73A1B72167; Mon, 20 May 2019 08:38:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 20 May 2019 08:38:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: pdraganov@taxback.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110714-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110714] New: Xorg crashes randomly because of memory
 leak
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
Content-Type: multipart/mixed; boundary="===============1351051058=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1351051058==
Content-Type: multipart/alternative; boundary="15583415051.aAFBD76.19109"
Content-Transfer-Encoding: 7bit


--15583415051.aAFBD76.19109
Date: Mon, 20 May 2019 08:38:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

            Bug ID: 110714
           Summary: Xorg crashes randomly because of memory leak
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: pdraganov@taxback.com
        QA Contact: xorg-team@lists.x.org

Created attachment 144304
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144304&action=3Dedit
Xorg.log and gdb of coredump

Xorg (xorg-x11-server-Xorg-1.20.4-3.fc30.x86_64,
xorg-x11-drv-nouveau-1.0.15-7.fc30.x86_64) crashes randomly on NVIDIA
Corporation GT216 [GeForce GT 220] (rev a2) with glamor out of memory
segmentation fault:

[ 32704.411] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[ 32704.907] (WW) glamor: Failed to allocate 40x4 FBO due to GL_OUT_OF_MEMO=
RY.
[ 32704.908] (WW) glamor: Expect reduced performance.
[ 32704.908] (EE)=20
[ 32704.908] (EE) Backtrace:
[ 32704.954] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x55f8f11f175=
c]
[ 32704.978] (EE) 1: /lib64/libpthread.so.0 (funlockfile+0x50) [0x7ff9bb6ec=
ebf]
[ 32704.980] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x81) [0x7ff9bad74101]
[ 32704.981] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7c81) [0x7ff9bad86991]
[ 32704.982] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8054) [0x7ff9bad870e4]
[ 32704.983] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x86af) [0x7ff9bad878bf]
[ 32704.985] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa66c) [0x7ff9bad8b4ac]
[ 32704.985] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
[0x55f8f11734a0]
[ 32704.986] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x11610) [0x7ff9bad99ac0]
[ 32704.987] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4228) [0x55f8f116bca8]
[ 32704.987] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x35e)
[0x55f8f1092c6e]
[ 32704.988] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x55f8f1096ce4]
[ 32704.989] (EE) 12: /lib/libc.so.6 (__libc_start_main+0xf3) [0x7ff9bb537f=
33]
[ 32704.989] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x55f8f108081e]
[ 32704.989] (EE)=20
[ 32704.989] (EE) Segmentation fault at address 0x0
[ 32704.989] (EE)=20
Fatal server error:
[ 32704.990] (EE) Caught signal 11 (Segmentation fault). Server aborting

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583415051.aAFBD76.19109
Date: Mon, 20 May 2019 08:38:25 +0000
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
   title=3D"NEW - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">110714</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg crashes randomly because of memory leak
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>pdraganov&#64;taxback.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144304=
" name=3D"attach_144304" title=3D"Xorg.log and gdb of coredump">attachment =
144304</a> <a href=3D"attachment.cgi?id=3D144304&amp;action=3Dedit" title=
=3D"Xorg.log and gdb of coredump">[details]</a></span>
Xorg.log and gdb of coredump

Xorg (xorg-x11-server-Xorg-1.20.4-3.fc30.x86_64,
xorg-x11-drv-nouveau-1.0.15-7.fc30.x86_64) crashes randomly on NVIDIA
Corporation GT216 [GeForce GT 220] (rev a2) with glamor out of memory
segmentation fault:

[ 32704.411] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[ 32704.907] (WW) glamor: Failed to allocate 40x4 FBO due to GL_OUT_OF_MEMO=
RY.
[ 32704.908] (WW) glamor: Expect reduced performance.
[ 32704.908] (EE)=20
[ 32704.908] (EE) Backtrace:
[ 32704.954] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x55f8f11f175=
c]
[ 32704.978] (EE) 1: /lib64/libpthread.so.0 (funlockfile+0x50) [0x7ff9bb6ec=
ebf]
[ 32704.980] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x81) [0x7ff9bad74101]
[ 32704.981] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7c81) [0x7ff9bad86991]
[ 32704.982] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8054) [0x7ff9bad870e4]
[ 32704.983] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x86af) [0x7ff9bad878bf]
[ 32704.985] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa66c) [0x7ff9bad8b4ac]
[ 32704.985] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
[0x55f8f11734a0]
[ 32704.986] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x11610) [0x7ff9bad99ac0]
[ 32704.987] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4228) [0x55f8f116bca8]
[ 32704.987] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x35e)
[0x55f8f1092c6e]
[ 32704.988] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x55f8f1096ce4]
[ 32704.989] (EE) 12: /lib/libc.so.6 (__libc_start_main+0xf3) [0x7ff9bb537f=
33]
[ 32704.989] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x55f8f108081e]
[ 32704.989] (EE)=20
[ 32704.989] (EE) Segmentation fault at address 0x0
[ 32704.989] (EE)=20
Fatal server error:
[ 32704.990] (EE) Caught signal 11 (Segmentation fault). Server aborting</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583415051.aAFBD76.19109--

--===============1351051058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1351051058==--
