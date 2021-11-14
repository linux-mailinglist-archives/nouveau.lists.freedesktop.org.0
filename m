Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB444FA17
	for <lists+nouveau@lfdr.de>; Sun, 14 Nov 2021 20:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F88F89CE3;
	Sun, 14 Nov 2021 19:13:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7044D89DF9
 for <nouveau@lists.freedesktop.org>; Sun, 14 Nov 2021 01:25:47 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 13so26725674ljj.11
 for <nouveau@lists.freedesktop.org>; Sat, 13 Nov 2021 17:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=zq3P2FuXDsszO3/rzBiVtH9v5De7G1T9e1MLjbN9ZZg=;
 b=fdNIJhQec8VpOGstU2I9ML+PwRj/a3Zf0do+5fMZeWr63GihX/vvuHODElGbr4vZiF
 l763qGqDklOkmrszI4YTtT+QmPFzoEscXxRRf5uCoTygjL/nJ3SfwoPUo+mvBwVRCXc4
 5rYNpjr4rUuYO85Ly2V5XDT0VSi+feCuCdvN/axN+L+LP1qMcHp56aGcQ8FwjOeRi0ES
 5ro2IG6XHviMMq49Smr1lQhuHMhsxpDV6y7CG24ODyCDmt2mUzjBprqSxjFPyRKtVwcF
 SCwcHF1uNFMI0e4pNEWZ9GVEtV9a/SUypR9nutyatySH3zWswG12a1/7Zvh08PZch+gQ
 vlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zq3P2FuXDsszO3/rzBiVtH9v5De7G1T9e1MLjbN9ZZg=;
 b=v6LAVF/cN86yuKpJUqFuX1TPSODApiPOrpXc6Y/GJhtECHn3Wqwyr2kpq9lGQuwIR1
 LldG4YRRSBcvxP0SGlFOaQPkuONC7gHdZYMEzU0py5pPnQkpMWYpJm588EjMlDpBro1a
 vzRYG8BIx9O0g3L/NnW5Qvrf5HJh020IZFbR8UUMZ/tE5F2fVMBLfJj1bv04vuExBECb
 Fl0Z4bUWqiJ+RHW+a0ivZPZZNqOKUblwViLJuXCS2N/2lg/rA8IySVba6T3/Lxg3abXf
 jBdUXKYoO/hBY95/OIt1x/tSTSeM0cFOuvDr/+89PnTLU/Zq1SkZEuxHqG14CjeKsoHv
 SdHg==
X-Gm-Message-State: AOAM530XvGPfJvnyNyxGtrkJMW7GR5kb8OW+SSDT4MemialRNPHkYeRe
 zWa7eQHLEqcSem7d6usQyJIocpqkGfQiJVBbMguQ0h49tjhmvPX9
X-Google-Smtp-Source: ABdhPJz3ngnjNESpXfs1sqMZIPN14gHvji4HySutbh/bNIblpfDNrAvt2slV80CyNep/n7NcCuJaJ7/BnuiCv0tpvW8=
X-Received: by 2002:a2e:7310:: with SMTP id o16mr23293001ljc.394.1636853145278; 
 Sat, 13 Nov 2021 17:25:45 -0800 (PST)
MIME-Version: 1.0
From: __- -__ <isapgswell@gmail.com>
Date: Sat, 13 Nov 2021 22:25:28 -0300
Message-ID: <CAN9WMdPfKr0avHiKYYkkkLSbS3wbtbnc-7ObPtymi_kcPxpmzg@mail.gmail.com>
To: nouveau@lists.freedesktop.org, ubuntu-users@lists.ubuntu.com, 
 debian-boot@lists.debian.org, System76 <help@system76.com>
Content-Type: multipart/alternative; boundary="000000000000461fd805d0b5920e"
X-Mailman-Approved-At: Sun, 14 Nov 2021 19:13:03 +0000
Subject: [Nouveau] 'nvidia' prop noscreen_tearing no_flickering
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--000000000000461fd805d0b5920e
Content-Type: text/plain; charset="UTF-8"

Greetings

thus my 40-libinput.conf and 10-nvidia.conf

Section "InputClass"
        Identifier "pointer catchall"
        Driver "mouse"
EndSection

Section "InputClass"
        Identifier "keyboard catchall"
        Driver "kbd"
EndSection

Section "InputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Option "Primary" "on"
    Driver "nvidia"
EndSection


Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "PrimaryGPU" "on"
    Option "AllowEmptyInitialConfiguration"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection

appears OK, at this period

Thank you

L. F

--000000000000461fd805d0b5920e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings</div><div><span style=3D"background-color:r=
gb(255,255,255)"><br></span></div><div><span style=3D"background-color:rgb(=
255,255,255)">thus my 40-libinput.conf and 10-nvidia.conf</span></div><div>=
<span style=3D"color:rgb(255,255,255)"><span style=3D"background-color:rgb(=
255,153,0)"><br></span></span></div><div><span style=3D"color:rgb(255,255,2=
55)"><span style=3D"background-color:rgb(255,153,0)">Section &quot;InputCla=
ss&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Identifier &quot;pointer catchall&q=
uot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Driver &quot;mouse&quot;<br>EndSection<=
br><br>Section &quot;InputClass&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Identi=
fier &quot;keyboard catchall&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Driver &q=
uot;kbd&quot;<br>EndSection</span></span></div><div><span style=3D"color:rg=
b(255,255,255)"><span style=3D"background-color:rgb(255,153,0)"><br></span>=
</span></div><div><span style=3D"color:rgb(255,255,255)"><span style=3D"bac=
kground-color:rgb(255,153,0)">Section &quot;InputClass&quot;<br>=C2=A0 =C2=
=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia=
-drm&quot;<br>=C2=A0 =C2=A0 Option &quot;Primary&quot; &quot;on&quot;<br>=
=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br>EndSection</span></span></div><d=
iv><br></div><div><br></div><div><span style=3D"color:rgb(0,255,0)"><span s=
tyle=3D"background-color:rgb(255,255,0)">Section &quot;OutputClass&quot;<br=
>=C2=A0 =C2=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &=
quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br>=C2=A0 =
=C2=A0 Option &quot;PrimaryGPU&quot; &quot;on&quot; <br>=C2=A0 =C2=A0 Optio=
n &quot;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =C2=A0 ModulePath &q=
uot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndSection</span></span>=
<br></div><div><br></div><div>appears OK, at this period</div><div><br></di=
v><div>Thank you<br></div><div><br></div><div>L. F</div><div><br></div></di=
v>

--000000000000461fd805d0b5920e--
