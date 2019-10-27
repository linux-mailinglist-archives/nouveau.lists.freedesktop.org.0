Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F1E64C0
	for <lists+nouveau@lfdr.de>; Sun, 27 Oct 2019 18:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96036E2C4;
	Sun, 27 Oct 2019 17:58:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 291E16E2A9
 for <nouveau@lists.freedesktop.org>; Sun, 27 Oct 2019 17:58:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1CA8B720E2; Sun, 27 Oct 2019 17:58:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 27 Oct 2019 17:58:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: prymoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-L6kc2It4g6@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0883400207=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0883400207==
Content-Type: multipart/alternative; boundary="15721991200.8a24AAa.16429"
Content-Transfer-Encoding: 7bit


--15721991200.8a24AAa.16429
Date: Sun, 27 Oct 2019 17:58:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #118 from Przemys=C5=82aw Kopa <prymoo@gmail.com> ---
(In reply to Lukas Wunner from comment #116)
> @Przemys=C5=82aw Kopa:
>=20
> The fix was applied by Takashi Iwai on Thursday Oct 17 with commit
> 94989e318b2f, it was merged to Linus' tree on Friday Oct 18 and will thus=
 be
> part of v5.4-rc4 due out later today. It should appear in v5.3-stable wit=
hin
> 1 or 2 weeks. You may want to double-check that the issue is gone with th=
is
> fix.

Thanks, I can happily confirm that the issue is fixed in v5.4-rc4. :)

> There's one problem remaining, you shouldn't have to manually echo "auto"=
 to
> the HDA's control file because we call pm_runtime_allow() on the HDA devi=
ce
> in drivers/pci/quirks.c:quirk_gpu_hda() -> pci_create_device_link().
> Something must be calling pm_runtime_forbid() afterwards, perhaps this is
> triggered from user space on Arch Linux. I'm attaching a little debug pat=
ch
> which logs a stacktrace to dmesg whenever pm_runtime_allow() / _forbid() =
is
> called for a device. Feel free to attach dmesg output with this patch
> applied and I'll be happy to take a look at it.

I'm attaching dmesg dump - last stack trace is generated after me echoing
"auto" to HDA control file.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15721991200.8a24AAa.16429
Date: Sun, 27 Oct 2019 17:58:40 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c118">Comme=
nt # 118</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
prymoo&#64;gmail.com" title=3D"Przemys=C5=82aw Kopa &lt;prymoo&#64;gmail.co=
m&gt;"> <span class=3D"fn">Przemys=C5=82aw Kopa</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href=3D"show_bug.cgi?id=3D75=
985#c116">comment #116</a>)
<span class=3D"quote">&gt; &#64;Przemys=C5=82aw Kopa:
&gt;=20
&gt; The fix was applied by Takashi Iwai on Thursday Oct 17 with commit
&gt; 94989e318b2f, it was merged to Linus' tree on Friday Oct 18 and will t=
hus be
&gt; part of v5.4-rc4 due out later today. It should appear in v5.3-stable =
within
&gt; 1 or 2 weeks. You may want to double-check that the issue is gone with=
 this
&gt; fix.</span >

Thanks, I can happily confirm that the issue is fixed in v5.4-rc4. :)

<span class=3D"quote">&gt; There's one problem remaining, you shouldn't hav=
e to manually echo &quot;auto&quot; to
&gt; the HDA's control file because we call pm_runtime_allow() on the HDA d=
evice
&gt; in drivers/pci/quirks.c:quirk_gpu_hda() -&gt; pci_create_device_link().
&gt; Something must be calling pm_runtime_forbid() afterwards, perhaps this=
 is
&gt; triggered from user space on Arch Linux. I'm attaching a little debug =
patch
&gt; which logs a stacktrace to dmesg whenever pm_runtime_allow() / _forbid=
() is
&gt; called for a device. Feel free to attach dmesg output with this patch
&gt; applied and I'll be happy to take a look at it.</span >

I'm attaching dmesg dump - last stack trace is generated after me echoing
&quot;auto&quot; to HDA control file.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15721991200.8a24AAa.16429--

--===============0883400207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0883400207==--
