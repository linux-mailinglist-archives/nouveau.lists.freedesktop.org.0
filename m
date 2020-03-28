Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF71962E6
	for <lists+nouveau@lfdr.de>; Sat, 28 Mar 2020 02:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D2A6E108;
	Sat, 28 Mar 2020 01:34:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0706E108
 for <nouveau@lists.freedesktop.org>; Sat, 28 Mar 2020 01:34:17 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id x206so7479773vsx.5
 for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2020 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AjaVYjSlyttby82ZK/g3pqudsOMZ505niNrrJrL+sy4=;
 b=RWAYlu3WA2PxCeAfNXbwCt5K+n9HGYYq/81Kj3jweruwczD81mqUOP2hhy0tHfjY0C
 bvg/JECtslpVf8hF3Bzl87UWGLBiMZBpBKwnP5yGx1EPWgn6QBU4MsaQRRaCSufXTo5D
 aZjCTCTLauKTrL55B+5RxeyOiu8NmCjHNmP+4hPXY+j0ru/R8wsmwVd48xjr2A2CouCG
 KvH13VC/+g/uKU/jIJklOv0JoYI0D9GXlOczsXMpO4WUMHJCyrPJgsmM4QuqlWVgw8b4
 sgNgVXafU5bYKSlDuUjoUTSEP/YctAf2VIU2dMxPk4wf2hUJId92gpBk3lB7gd7Q3O/b
 i+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AjaVYjSlyttby82ZK/g3pqudsOMZ505niNrrJrL+sy4=;
 b=bFjYVFHdayQkmMuLQrE7SYq2qs9F7nmL3BL1iC0gpaOqWMrYTvLM2EbKXxIvkYNIOi
 dIp8xDy2ebz08Txdjd7Q7wDYvEP+lGbwl6EbwwB+hDRxB3GUOF8q5T+F8yjAd9+ehe3g
 y2JFFLARj+GbI2n4ClMP5MgM5b4ZAYp7L+2Np5u8z7RQpDg2VJyCAgvNMSJwd0zua5XN
 GOt8HckrbiGzF87Pe6zgbSzyUUnmSrGKZe02A7+5zbmfGFR7AMJ8KDrIchu0ZD1OfSf/
 Gr0k6GzdZlzOag7Rx5jUkU7urTzbLdxeP4bQnoIvu4mIfCkBnpcEG7tP7HM0FAirH5Ki
 sKlw==
X-Gm-Message-State: AGi0PuaU6Wb+azRDiP3Q0qNxOaN4p3aJTsyfqnoj5g1t5/ZtneOgnCoY
 6jlSnnK0YpsKLaDL5tS3JHXCiO1QAOkDVZZBWHw64CDY
X-Google-Smtp-Source: APiQypKaB07KsdyhlzclyUJCe5PK8mLhhou+pcVFzLqOTG8wjMHtUvjhoUTLV0XhP2rP0rBVjAOH5LzkLSCUclkixxE=
X-Received: by 2002:a67:3141:: with SMTP id x62mr1314786vsx.31.1585359256311; 
 Fri, 27 Mar 2020 18:34:16 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Fri, 27 Mar 2020 21:32:13 -0400
Message-ID: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] Question on MME and Compute Subchannel in Kepler+
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
Content-Type: multipart/mixed; boundary="===============1696290049=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1696290049==
Content-Type: multipart/alternative; boundary="000000000000505c7c05a1e037ee"

--000000000000505c7c05a1e037ee
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I've been trying to adapt a switch emulator to emulate nouveau's compute.
We've been told some things like indirect dispatch use the MME in Nouveau,
however, looking at NVIDIA's open gpu documentation there's no MME in
compute engine since Kepler.
https://github.com/NVIDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h MME
for compute should still exist because of the presence of MME Shadow Memory
Scratch registers.

How does MME for Compute works on Kepler+ ? Does it use the 3D Subchannel?
if so how do I know when its targeting the Compute Subchannel?

--000000000000505c7c05a1e037ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>I&#39;ve bee=
n trying to adapt a switch emulator to emulate=C2=A0nouveau&#39;s compute. =
We&#39;ve been told some things like indirect dispatch use the MME in Nouve=
au, however, looking at NVIDIA&#39;s open gpu documentation there&#39;s no =
MME in compute engine since Kepler.=C2=A0<a href=3D"https://github.com/NVID=
IA/open-gpu-doc/blob/master/classes/compute/clb1c0.h">https://github.com/NV=
IDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h</a>=C2=A0MME for com=
pute should still exist because of the presence of MME Shadow Memory Scratc=
h registers.=C2=A0</div><div><br></div><div>How does MME for Compute works =
on Kepler+=C2=A0? Does it use the 3D Subchannel? if so how do I know when i=
ts targeting=C2=A0the Compute Subchannel?</div><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"></div></div>

--000000000000505c7c05a1e037ee--

--===============1696290049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1696290049==--
