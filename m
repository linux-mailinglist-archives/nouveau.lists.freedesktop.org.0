Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA65DF25
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 09:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC656E0ED;
	Wed,  3 Jul 2019 07:53:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25F366E0B8
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 07:53:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2338472167; Wed,  3 Jul 2019 07:53:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 07:53:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: karolherbst@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-vXUKqtLIFR@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1800780561=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1800780561==
Content-Type: multipart/alternative; boundary="15621404232.eBa2a3.24450"
Content-Transfer-Encoding: 7bit


--15621404232.eBa2a3.24450
Date: Wed, 3 Jul 2019 07:53:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #6 from Karol Herbst <karolherbst@gmail.com> ---
(In reply to Peter Draganov from comment #4)
> The problem persists in xorg-x11-server-Xorg-1.20.5-3.fc30.x86_64:
>=20
> [113930.196] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
> [113930.198] (WW) glamor: Failed to allocate 5x1 FBO due to GL_OUT_OF_MEM=
ORY.
> [113930.198] (WW) glamor: Expect reduced performance.
> [113930.198] (EE)=20
> [113930.198] (EE) Backtrace:
> [113930.235] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x5637893b8=
adc]
> [113930.238] (EE) unw_get_proc_name failed: no unwind info found [-10]
> [113930.238] (EE) 1: /lib64/libpthread.so.0 (?+0x0) [0x7f264909ee7f]
> [113930.239] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_get_pixmap_texture+0xa1) [0x7f2648726181]
> [113930.240] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_create_gc+0x7b84) [0x7f2648738814]
> [113930.241] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_create_gc+0x7f64) [0x7f2648738f84]
> [113930.241] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_create_gc+0x85bf) [0x7f264873975f]
> [113930.242] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_create_gc+0xa57a) [0x7f264873d34a]
> [113930.242] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
> [0x56378933a670]
> [113930.243] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
> (glamor_create_gc+0x1150a) [0x7f264874b92a]
> [113930.243] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4238) [0x563789332eb8]
> [113930.243] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x354)
> [0x563789259d54]
> [113930.243] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x56378925de14]
> [113930.244] (EE) unw_get_proc_name failed: no unwind info found [-10]
> [113930.244] (EE) 12: /lib/libc.so.6 (?+0x0) [0x7f2648ee9e40]
> [113930.244] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x56378924786e]
> [113930.244] (EE)=20
> [113930.244] (EE) Segmentation fault at address 0x0
> [113930.244] (EE)=20
> Fatal server error:
> [113930.244] (EE) Caught signal 11 (Segmentation fault). Server aborting

huh, that's weird. Will try to look into it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621404232.eBa2a3.24450
Date: Wed, 3 Jul 2019 07:53:43 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Peter Draganov from <a href=3D"show_bug.cgi?id=3D=
110714#c4">comment #4</a>)
<span class=3D"quote">&gt; The problem persists in xorg-x11-server-Xorg-1.2=
0.5-3.fc30.x86_64:
&gt;=20
&gt; [113930.196] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
&gt; [113930.198] (WW) glamor: Failed to allocate 5x1 FBO due to GL_OUT_OF_=
MEMORY.
&gt; [113930.198] (WW) glamor: Expect reduced performance.
&gt; [113930.198] (EE)=20
&gt; [113930.198] (EE) Backtrace:
&gt; [113930.235] (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13c) [0x563789=
3b8adc]
&gt; [113930.238] (EE) unw_get_proc_name failed: no unwind info found [-10]
&gt; [113930.238] (EE) 1: /lib64/libpthread.so.0 (?+0x0) [0x7f264909ee7f]
&gt; [113930.239] (EE) 2: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_get_pixmap_texture+0xa1) [0x7f2648726181]
&gt; [113930.240] (EE) 3: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_create_gc+0x7b84) [0x7f2648738814]
&gt; [113930.241] (EE) 4: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_create_gc+0x7f64) [0x7f2648738f84]
&gt; [113930.241] (EE) 5: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_create_gc+0x85bf) [0x7f264873975f]
&gt; [113930.242] (EE) 6: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_create_gc+0xa57a) [0x7f264873d34a]
&gt; [113930.242] (EE) 7: /usr/libexec/Xorg (DamageRegionAppend+0x6c0)
&gt; [0x56378933a670]
&gt; [113930.243] (EE) 8: /usr/lib64/xorg/modules/libglamoregl.so
&gt; (glamor_create_gc+0x1150a) [0x7f264874b92a]
&gt; [113930.243] (EE) 9: /usr/libexec/Xorg (AddTraps+0x4238) [0x563789332e=
b8]
&gt; [113930.243] (EE) 10: /usr/libexec/Xorg (SendErrorToClient+0x354)
&gt; [0x563789259d54]
&gt; [113930.243] (EE) 11: /usr/libexec/Xorg (InitFonts+0x3b4) [0x56378925d=
e14]
&gt; [113930.244] (EE) unw_get_proc_name failed: no unwind info found [-10]
&gt; [113930.244] (EE) 12: /lib/libc.so.6 (?+0x0) [0x7f2648ee9e40]
&gt; [113930.244] (EE) 13: /usr/libexec/Xorg (_start+0x2e) [0x56378924786e]
&gt; [113930.244] (EE)=20
&gt; [113930.244] (EE) Segmentation fault at address 0x0
&gt; [113930.244] (EE)=20
&gt; Fatal server error:
&gt; [113930.244] (EE) Caught signal 11 (Segmentation fault). Server aborti=
ng</span >

huh, that's weird. Will try to look into it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621404232.eBa2a3.24450--

--===============1800780561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1800780561==--
