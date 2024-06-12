Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A8904BF5
	for <lists+nouveau@lfdr.de>; Wed, 12 Jun 2024 08:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFD910E792;
	Wed, 12 Jun 2024 06:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="msY3ysFE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA07C10E792
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jun 2024 06:51:50 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6cdf9a16229so4891498a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jun 2024 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718175110; x=1718779910; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O94JCCPRfKgGZD95swLalkLWFka33lFV+P9bipvobLs=;
 b=msY3ysFEIxL7G1WQrjHl7EIZnbAQllj6c7PJ3mJ4MINrFhGsxvU+mdNnteKj7RMScX
 YazIB056WLtTJSHxUnMnZVslt8r9PvGcZL8Qidsm3RhF9NLUOoPZ6tscpIrdzMaeWJlL
 Pi64qTQdZLvU7OGkGcyjbdoUsEi55V6T3dA2V2C17ayhGTaa/ymVrQhBxVCYuj3y3+Hv
 kYALvy3vja9GGY+THbt4bEqfGDVPLdORiRf4DBL8aD7xPLyHVcklWvkA8QIkC4IPnSL4
 gL4HN9o31eLkoyU+iHuIay97RnECDRE01CQTCYteHZlie7CeyiDLut2bR/fEfzl/VhlS
 lPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718175110; x=1718779910;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O94JCCPRfKgGZD95swLalkLWFka33lFV+P9bipvobLs=;
 b=sIhb+Rr22UMVpjrIOYwpwY5IuMWzc+NDLVlUWt+LhUSCH4KgFzCxFklmbaASE9Nr2C
 SL2i1qFEVWoAJJnLcrFlHuDfkJCzVZms1FTF4rjSnS1IJj61d22xS/e7md9FkB/zsaYo
 aH5Uvoax9C/37/SIdiFKd8U8nVObqGPduIVNtUFtxV4ghrS+UBX7lKrjLZj3Sv++OZkP
 l6IwW8B6pU2t4ktwOvgIqUEFCbe7ndjIo6cK8rcmgra3UZaVxtJsmfS6JraOzSc3KYMe
 t7D/ox/EJ9/q2BiX2WET/OIKisgzJ18foCduQvlEcD1BAZ10KsuL5nXX07eCs0JX+igJ
 1Xyg==
X-Gm-Message-State: AOJu0Yxx9yAqHpyTtXmF4p26jGKa78VVO3j7rE3vpetriuLaJiPU1gsn
 izjxwSOuKDTgWj2DSgFJqfdPuunDPhaeXhPitJZs6jLr1i9e2G8n1I9x/gptskQHsl46Y51Tc56
 duhi6p9NHZKmlj6VLEHFiIhP1uEGFggkk0q4=
X-Google-Smtp-Source: AGHT+IGxWR1tgLA7LUSv5PoYBYmVUDYUgGpS7w41Ta5sh0eEcpC9RGxKVjM678LbnRZAIIvBnjgM7O9LHcRR1szylHs=
X-Received: by 2002:a05:6a21:18f:b0:1b3:fb21:2960 with SMTP id
 adf61e73a8af0-1b8a9bd5388mr1253235637.30.1718175109913; Tue, 11 Jun 2024
 23:51:49 -0700 (PDT)
MIME-Version: 1.0
From: Flavio Bagnato <flaviobagnato@gmail.com>
Date: Wed, 12 Jun 2024 16:51:38 +1000
Message-ID: <CAA2vdr7qdj=N-SLXQn8SjMbRtvOLg0w61kvUF2W46vO9O5gpdQ@mail.gmail.com>
Subject: nouveau freezing desktop - Ubuntu 24.04 - NVIDIA GeForce GT 330M
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000016a591061aabd128"
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

--00000000000016a591061aabd128
Content-Type: text/plain; charset="UTF-8"

Hello,

I recently installed Ubuntu 24.04 on a MacBook Pro (Mid-2010) running a
NVIDIA GeForce GT 330M adapter.

Unfortunately the computer is constantly freezing.

If I pass "nomodeset" to grub, the nouveau driver is not used and the
computer does not freeze so it seems to be related to the nouveau driver.

I am wanting to know if there are any parameters I can pass to nouveau to
resolve the freezing.

I have tried temporarily replacing nomodeset with nouveau.noaccel=1 then
with nouveau.nofbaccel=1 but both caused the booting to freeze.

I have also tried temporarily replacing nomodeset with nouveau.modeset=0 to
disable nouveau but got a blank screen whilst booting (I've seen this blank
screen reported by others on the web).

I should be reporting a bug I assume but when the computer freezes I have
to turn the computer off and therefore dmesg is not an option to provide
logs.

I have noticed in dmesg however 2 messages that read:

nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]]
subc 3 class 8597 mthd 1304 data 1d1c1b1a

followed by......

nouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]

These 2 messages are repeated regularly.

Is there anything I can do (like pass any parameters) that may resolve the
computer freezing?

Regards,

Flavio

--00000000000016a591061aabd128
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I recently installed =
Ubuntu 24.04 on a MacBook Pro (Mid-2010) running a NVIDIA GeForce GT 330M a=
dapter.</div><div><br></div><div>Unfortunately the computer is constantly f=
reezing.</div><div><br></div><div>If I pass &quot;nomodeset&quot; to grub, =
the nouveau driver is not used and the computer does not freeze so it seems=
 to be related to the nouveau driver.</div><div><br></div><div>I am wanting=
 to know if there are any parameters I can pass to nouveau to resolve the f=
reezing.</div><div><br></div><div>I have tried temporarily replacing nomode=
set with nouveau.noaccel=3D1 then with nouveau.nofbaccel=3D1 but both cause=
d the booting to freeze. <br></div><div><br></div><div>I have also tried=20
 temporarily replacing nomodeset with nouveau.modeset=3D0 to disable nouvea=
u but got a blank screen whilst booting (I&#39;ve seen this blank screen re=
ported by others on the web). <br></div><div><br></div><div>I should be rep=
orting a bug I assume but when the computer freezes I have to turn the comp=
uter off and therefore dmesg is not an option to provide logs.</div><div><b=
r></div><div>I have noticed in dmesg however 2 messages that read:</div><di=
v></div><div>
<p>nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]=
] subc 3 class 8597 mthd 1304 data 1d1c1b1a</p><p>followed by......</p><p>n=
ouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]</p>
<p>These 2 messages are repeated regularly.</p><p>Is there anything I can d=
o (like pass any parameters) that may resolve the computer freezing?</p><p>=
Regards,</p><p>Flavio<br></p>

</div></div>

--00000000000016a591061aabd128--
