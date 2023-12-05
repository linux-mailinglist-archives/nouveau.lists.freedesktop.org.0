Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0780574C
	for <lists+nouveau@lfdr.de>; Tue,  5 Dec 2023 15:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB2610E239;
	Tue,  5 Dec 2023 14:28:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E921810E239
 for <nouveau@lists.freedesktop.org>; Tue,  5 Dec 2023 14:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701786482; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VaGGrg7RUVf5Z7Qc8hf+BMCYNrVYTIcDKwQAucJ75+jetmVvFJyS9a0oKHM19bfaxBJhcmR6qXb/idnD4Mmvu4P4oVp6G2V+8ByjimzrMFB0KzJWfS/1IfxSAet7RKI9SPaZmHlnlAj+piKGs0mUUSL2Y4lTVQpXP9iwW8zW8+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701786482;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=O1YSZoI9l7F4lb/LH3BXl4x9IeuPIQdch8tDruo8Hls=; 
 b=WX/P2csJuokwNUZRuPa+J3yCCfvPz6RmpTlgJ2T0yCZ+Ab6HTGagOkSxSAtjkp75cEMMERhUSd1wOfDtzTNkef3ml+o+FVGv7r5596oBc4Yykp3ewTSsMQRJGwUMaBw+AwuDBgZKtTp/pxoyKUOeBwUi5Ur1AkNaHAAlY3dKByQ=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701786482; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=O1YSZoI9l7F4lb/LH3BXl4x9IeuPIQdch8tDruo8Hls=;
 b=WI6vSKwjQtJPEL0W8ms1HYnNGx/YsokQ3FpUilgmQ5sJTaPW86KSZ3ZxZv/SlaJk
 iecuLziXcmfvOPu2cbEVQMqiy3J8jOC8bhg/X9ZMvVMJIVOkZXkMT/ShbIWmhcPjWcs
 0NSJ64WUrr/ysOEYKshOrNlBK6GT5wo5PaXb5n+I=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1701786475737366.0325069060699;
 Tue, 5 Dec 2023 06:27:55 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Tue, 5 Dec 2023 06:27:55 -0800 (PST)
Date: Tue, 05 Dec 2023 09:27:55 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c3a60dcc9.b6b5c07328625.5575400648759809450@zoho.com>
In-Reply-To: <CAPM=9tz6xA=iY617nCTpjW9haJzV=nhgbQfVVzkdG8GYphM+Ww@mail.gmail.com>
References: <18c311115a3.b63b522e4445.755018207880528406@zoho.com>
 <CAPM=9tz6xA=iY617nCTpjW9haJzV=nhgbQfVVzkdG8GYphM+Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011228d32190eed38885304dc689ce0000c65e2f1812160daa95a07030d60d92bccd89540b60cc7968ec02:zu080112276e9c1060ce404e37a64ff7bd000043d84541384997237f2ad35f3cb108232bb1ebef081b5af117:rf08011231da6e28abd03b020055c859550000287c0a66af359f3a69b27a624f2677b3963b60589f9b453d6756ca31ea1f4a9b84dd0e:ZohoMail
Subject: Re: [Nouveau] GPU MMU faults (was Meaning of the engines in
 paramaters of nouveau module)
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

---- Le lun., 04 d=C3=A9c. 2023 22:27:49 -0500 Dave Airlie  a =C3=A9crit --=
--

 > On Mon, 4 Dec 2023 at 05:04, Paul Dufresne dufresnep@zoho.com> wrote:=20
 > >=20
 > > In https://nouveau.freedesktop.org/KernelModuleParameters.html, there =
is:=20
 > > Here is a list of engines:=20
 > >     DEVICE=20
 > >     DMAOBJ=20
...
 > >     PVP=20
 > >     SW=20
 > > Also, in debug:=20
 > >    CLIENT=20
 > >=20
...
 > > Also, my interest is linked to the state of GPU graph given after a co=
ntext switch timeout that looks like:=20
 > > [ 1696.780305] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEO=
UT]=20
 > > [ 1696.780361] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e00=
5: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6=20
 > > [ 1696.780422] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 0005000=
5: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5=20
 > > [ 1696.780476] nouveau 0000:01:00.0: fifo:000004:04[     ce0]: 0000000=
0: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0=20
 > > [ 1696.780529] nouveau 0000:01:00.0: fifo:000001:01[  mspdec]: 0000000=
0: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0=20
 > > [ 1696.780581] nouveau 0000:01:00.0: fifo:000002:02[   msppp]: 0000000=
0: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0=20
 > > [ 1696.780633] nouveau 0000:01:00.0: fifo:000003:03[   msvld]: 0000000=
0: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0=20
 > > [ 1696.780689] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e00=
5: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6=20
 > > [ 1696.780744] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e00=
5: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6=20
 > > [ 1696.780795] nouveau 0000:01:00.0: fifo:000000:00[      gr]: trigger=
ing mmu fault on 0x00=20
 > > [ 1696.780835] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 0005000=
5: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5=20
 > > [ 1696.780942] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 0000010=
0: mmu fault triggered=20
 > > [ 1696.780987] nouveau 0000:01:00.0: fifo:000000:00[      gr]: c006e00=
5: busy 1 faulted 1 chsw 1 save 1 load 1 chid 5*-> chid 6=20
 > > [ 1696.781040] nouveau 0000:01:00.0: fifo:000000:0005:[Renderer[13701]=
] rc scheduled=20
 > >=20
 > > where I suspect ce2, is linked to PCE2.=20
 > >=20
 > > Is there a documentation that describes those "engines"?=20
 > =20
 > CE is copy engine.=20
 > But this looks like an mmu fault on the GPU side, so some shader is=20
 > doing something wrong most likely.=20
 > =20
 > Dave.=20
 >=20

Sometimes the GPU mmu fault is on a gr engine, sometimes on ce2 engine.
But the driver is stable when using nouveau.noaccel=3D1 (not seen other kin=
d of errors too, like deadlock detections when using noaccel=3D1).

Looking at the code, I begin to think that noaccel=3D0 allows for user-side=
 channel creation, and so create the need for context switching... not sure=
.

