Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D275DE23
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 08:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC676E0AA;
	Wed,  3 Jul 2019 06:37:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CE4B6E0A0
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 06:37:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3A1DB72167; Wed,  3 Jul 2019 06:37:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 06:37:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: pdraganov@taxback.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110714-8800-sqnmsBLWap@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110714-8800@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110714] Xorg crashes randomly because of memory leak
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
Content-Type: multipart/mixed; boundary="===============0040434769=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0040434769==
Content-Type: multipart/alternative; boundary="15621358751.2E4c23A.17259"
Content-Transfer-Encoding: 7bit


--15621358751.2E4c23A.17259
Date: Wed, 3 Jul 2019 06:37:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

Peter Draganov <pdraganov@taxback.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|NOTOURBUG                   |---

--- Comment #4 from Peter Draganov <pdraganov@taxback.com> ---
The problem persists in xorg-x11-server-Xorg-1.20.5-3.fc30.x86_64:

[113930.196] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[113930.198] (WW) glamor: Failed to allocate 5x1 FBO due to GL_OUT_OF_MEMOR=
Y.
[113930.198] (WW) glamor: Expect reduced performance.
[113930.198] (EE)=20
[113930.198] (EE) Backtrace:
[113930.235] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x5637893b8ad=
c]
[113930.238] (EE) unw_get_proc_name failed: no unwind info found [-10]
[113930.238] (EE) 1: /lib64/libpthread.so.0 (?+0x0) [0x7f264909ee7f]
[113930.239] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0xa1) [0x7f2648726181]
[113930.240] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7b84) [0x7f2648738814]
[113930.241] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7f64) [0x7f2648738f84]
[113930.241] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x85bf) [0x7f264873975f]
[113930.242] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa57a) [0x7f264873d34a]
[113930.242] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
[0x56378933a670]
[113930.243] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1150a) [0x7f264874b92a]
[113930.243] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4238) [0x563789332eb8]
[113930.243] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x354)
[0x563789259d54]
[113930.243] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x56378925de14]
[113930.244] (EE) unw_get_proc_name failed: no unwind info found [-10]
[113930.244] (EE) 12: /lib/libc.so.6 (?+0x0) [0x7f2648ee9e40]
[113930.244] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x56378924786e]
[113930.244] (EE)=20
[113930.244] (EE) Segmentation fault at address 0x0
[113930.244] (EE)=20
Fatal server error:
[113930.244] (EE) Caught signal 11 (Segmentation fault). Server aborting

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621358751.2E4c23A.17259
Date: Wed, 3 Jul 2019 06:37:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pdraganov=
&#64;taxback.com" title=3D"Peter Draganov &lt;pdraganov&#64;taxback.com&gt;=
"> <span class=3D"fn">Peter Draganov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>NOTOURBUG
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pdraganov&#64;taxback.com" title=3D"Peter Draganov &lt;pdraganov&#64;taxbac=
k.com&gt;"> <span class=3D"fn">Peter Draganov</span></a>
</span></b>
        <pre>The problem persists in xorg-x11-server-Xorg-1.20.5-3.fc30.x86=
_64:

[113930.196] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[113930.198] (WW) glamor: Failed to allocate 5x1 FBO due to GL_OUT_OF_MEMOR=
Y.
[113930.198] (WW) glamor: Expect reduced performance.
[113930.198] (EE)=20
[113930.198] (EE) Backtrace:
[113930.235] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x5637893b8ad=
c]
[113930.238] (EE) unw_get_proc_name failed: no unwind info found [-10]
[113930.238] (EE) 1: /lib64/libpthread.so.0 (?+0x0) [0x7f264909ee7f]
[113930.239] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0xa1) [0x7f2648726181]
[113930.240] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7b84) [0x7f2648738814]
[113930.241] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7f64) [0x7f2648738f84]
[113930.241] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x85bf) [0x7f264873975f]
[113930.242] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa57a) [0x7f264873d34a]
[113930.242] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
[0x56378933a670]
[113930.243] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1150a) [0x7f264874b92a]
[113930.243] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4238) [0x563789332eb8]
[113930.243] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x354)
[0x563789259d54]
[113930.243] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x56378925de14]
[113930.244] (EE) unw_get_proc_name failed: no unwind info found [-10]
[113930.244] (EE) 12: /lib/libc.so.6 (?+0x0) [0x7f2648ee9e40]
[113930.244] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x56378924786e]
[113930.244] (EE)=20
[113930.244] (EE) Segmentation fault at address 0x0
[113930.244] (EE)=20
Fatal server error:
[113930.244] (EE) Caught signal 11 (Segmentation fault). Server aborting</p=
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

--15621358751.2E4c23A.17259--

--===============0040434769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0040434769==--
