Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9FDDD33
	for <lists+nouveau@lfdr.de>; Sun, 20 Oct 2019 09:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DC089D83;
	Sun, 20 Oct 2019 07:41:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7E9089D7D
 for <nouveau@lists.freedesktop.org>; Sun, 20 Oct 2019 07:41:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D4AF2720E2; Sun, 20 Oct 2019 07:41:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 20 Oct 2019 07:41:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-WYcHh6XEKg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-75985-8800@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
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
Content-Type: multipart/mixed; boundary="===============0530833099=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0530833099==
Content-Type: multipart/alternative; boundary="15715572668.C5dc9E23c.4343"
Content-Transfer-Encoding: 7bit


--15715572668.C5dc9E23c.4343
Date: Sun, 20 Oct 2019 07:41:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #116 from Lukas Wunner <lukas@wunner.de> ---
@Przemys=C5=82aw Kopa:

The fix was applied by Takashi Iwai on Thursday Oct 17 with commit
94989e318b2f, it was merged to Linus' tree on Friday Oct 18 and will thus be
part of v5.4-rc4 due out later today. It should appear in v5.3-stable withi=
n 1
or 2 weeks. You may want to double-check that the issue is gone with this f=
ix.

There's one problem remaining, you shouldn't have to manually echo "auto" to
the HDA's control file because we call pm_runtime_allow() on the HDA device=
 in
drivers/pci/quirks.c:quirk_gpu_hda() -> pci_create_device_link(). Something
must be calling pm_runtime_forbid() afterwards, perhaps this is triggered f=
rom
user space on Arch Linux. I'm attaching a little debug patch which logs a
stacktrace to dmesg whenever pm_runtime_allow() / _forbid() is called for a
device. Feel free to attach dmesg output with this patch applied and I'll be
happy to take a look at it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715572668.C5dc9E23c.4343
Date: Sun, 20 Oct 2019 07:41:06 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c116">Comme=
nt # 116</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>&#64;Przemys=C5=82aw Kopa:

The fix was applied by Takashi Iwai on Thursday Oct 17 with commit
94989e318b2f, it was merged to Linus' tree on Friday Oct 18 and will thus be
part of v5.4-rc4 due out later today. It should appear in v5.3-stable withi=
n 1
or 2 weeks. You may want to double-check that the issue is gone with this f=
ix.

There's one problem remaining, you shouldn't have to manually echo &quot;au=
to&quot; to
the HDA's control file because we call pm_runtime_allow() on the HDA device=
 in
drivers/pci/quirks.c:quirk_gpu_hda() -&gt; pci_create_device_link(). Someth=
ing
must be calling pm_runtime_forbid() afterwards, perhaps this is triggered f=
rom
user space on Arch Linux. I'm attaching a little debug patch which logs a
stacktrace to dmesg whenever pm_runtime_allow() / _forbid() is called for a
device. Feel free to attach dmesg output with this patch applied and I'll be
happy to take a look at it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715572668.C5dc9E23c.4343--

--===============0530833099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0530833099==--
