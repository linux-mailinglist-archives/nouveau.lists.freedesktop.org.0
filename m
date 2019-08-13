Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FCF8C276
	for <lists+nouveau@lfdr.de>; Tue, 13 Aug 2019 23:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEC26E02E;
	Tue, 13 Aug 2019 21:02:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65EFC6E042
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 21:02:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 19EE37215A; Tue, 13 Aug 2019 21:02:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 13 Aug 2019 21:02:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gius-italy@live.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111392-8800-ZznM5WtlAf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111392-8800@http.bugs.freedesktop.org/>
References: <bug-111392-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111392] [NV110] bus: MMIO read of 00000000 FAULT at
 619444 [ IBUS ]
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
Content-Type: multipart/mixed; boundary="===============1620760139=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1620760139==
Content-Type: multipart/alternative; boundary="15657301511.41E3A66.17738"
Content-Transfer-Encoding: 7bit


--15657301511.41E3A66.17738
Date: Tue, 13 Aug 2019 21:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111392

--- Comment #1 from Giuseppe Lumia <gius-italy@live.it> ---
I found out something new about the bug. Looks like the read on 0x619444 is
called by the function gm107_gr_init_bios_2 in
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drive=
rs/gpu/drm/nouveau/nvkm/engine/gr/gm107.c?h=3Dv5.2.8#n309.=20

I got nvapeek to work on my system ( I had to disable kernel_lockdown since=
 I
was getting "PCI init failure" ) and this is the output:

    ./nvapeek 0x619444
    00619444: badf1301


The curious thing is that if I analyze all the addresses preceding and
following 0x619444 I get only a list of badf1301 and badf1100 (so a "small
error" on the offset is to exclude).

Unfortunately I have no clue what this address 0x619444 refers to and why t=
he
function gm107_gr_init_bios_2 was added to the source code.=20

I also found out the commit which added this code:
https://github.com/torvalds/linux/commit/0f78acc86bbfc60cdaffd4eb03e4a35b28=
397cbb

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657301511.41E3A66.17738
Date: Tue, 13 Aug 2019 21:02:31 +0000
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
   title=3D"NEW - [NV110] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS=
 ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111392#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV110] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS=
 ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111392">bug 11139=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gius-italy&#64;live.it" title=3D"Giuseppe Lumia &lt;gius-italy&#64;live.it&=
gt;"> <span class=3D"fn">Giuseppe Lumia</span></a>
</span></b>
        <pre>I found out something new about the bug. Looks like the read o=
n 0x619444 is
called by the function gm107_gr_init_bios_2 in
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/tree/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c?h=3Dv5.2.8#n309">https=
://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gp=
u/drm/nouveau/nvkm/engine/gr/gm107.c?h=3Dv5.2.8#n309</a>.=20

I got nvapeek to work on my system ( I had to disable kernel_lockdown since=
 I
was getting &quot;PCI init failure&quot; ) and this is the output:

    ./nvapeek 0x619444
    00619444: badf1301


The curious thing is that if I analyze all the addresses preceding and
following 0x619444 I get only a list of badf1301 and badf1100 (so a &quot;s=
mall
error&quot; on the offset is to exclude).

Unfortunately I have no clue what this address 0x619444 refers to and why t=
he
function gm107_gr_init_bios_2 was added to the source code.=20

I also found out the commit which added this code:
<a href=3D"https://github.com/torvalds/linux/commit/0f78acc86bbfc60cdaffd4e=
b03e4a35b28397cbb">https://github.com/torvalds/linux/commit/0f78acc86bbfc60=
cdaffd4eb03e4a35b28397cbb</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657301511.41E3A66.17738--

--===============1620760139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1620760139==--
