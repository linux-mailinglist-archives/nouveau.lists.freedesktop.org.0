Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C87CBA994
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B6D10E9ED;
	Sat, 13 Dec 2025 12:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnsjLFxo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB28C10E04A
 for <nouveau@lists.freedesktop.org>; Sun,  9 Jun 2024 06:28:44 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3d1b6b6b2c5so403550b6e.0
 for <nouveau@lists.freedesktop.org>; Sat, 08 Jun 2024 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717914523; x=1718519323; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KfTnoDEE8ZOfj0cBKwxCKe6MRNLehS3BxuSWqnV70Pc=;
 b=SnsjLFxoVxUAT45BcQ51K5+xw8MYCzuHP8pEo7u96Kh6XhTbMSbVylR7diBuSAWuPF
 ZDEEngRaHj5xxzT+nqNth75Se3BJ3o7DCGdMxsnSLIwBTWtn+wygXwDpGR5ZdxXCy2/U
 FxbYWwSMIl4kXyR/MJikEoDeyiIPCdYaPPrvurln1ngd++47AcZSGj/YQsmKgs8FXlmU
 EwghCboDLalLKa1eaF8/88giSKwbPI3b8ielLvpuT8s4c/yAzKwYfGAUlaCduKW+uVXr
 BMq2bhMXMnsgQI8NzV3qu9o5p3me1uzPMjTkrq8nIFKsHAGt4Y+LFkHEZm6kV7bri0Ey
 dnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717914523; x=1718519323;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KfTnoDEE8ZOfj0cBKwxCKe6MRNLehS3BxuSWqnV70Pc=;
 b=tavBzMLWH1uOPFXU4vHA/S1d0SkEbiGgtlnw1jRU+YKIooN+b4AgqwfP5O6GiGMxy7
 I4I4KLl1C7GVwjBgfpX6g0AgP9NiTKLQGDGy893us5NI316V070ljHy7ruVZUYuZJL3y
 qXsa3dVuXLzxs65Lw3jFXsdGdPx5gaZLX7wuA1Wzl4JiHWtXGhgKRpptBJwWwbxIRWgb
 qoBHtoIWg9C/3b8N8MhSVhPCD5HHbOaTSmHe2aoC6yGap/4kCAY5saqLJbEQdMy+pP93
 f1tYVwHmC0QheTKSY1iSIM2km8FvRxOtqe2Daz6ovVR+w4UQokqw1o5mOIoIk6citi8w
 WY2g==
X-Gm-Message-State: AOJu0YwmeoXtiVNQALpmG9trgzwFX7CtedtDKsjyOO1QmbMXfaJdB6RW
 OwhIAVr/RLv+z/8KyLS+Td+BwW6n2DyqW/vfhGYkZExvXXVXObul24G+9dfjRPOtLGXbwMEGUMf
 qBpZbHMD0MAJDMFggsBYMWQR2durfWz4B
X-Google-Smtp-Source: AGHT+IFJrv6/jiaIWnTGTF8kvVjYXaYjqyFTyFAZwrVg1DdGQVheeTn2rGwGMtN6WBHIDpQVUaKyRpVNePU0exbPV1M=
X-Received: by 2002:a05:6871:b09:b0:254:b6f2:de93 with SMTP id
 586e51a60fabf-254b6f2f87cmr674490fac.0.1717914523252; Sat, 08 Jun 2024
 23:28:43 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TmFjaXllIEFsY8Sx?= <naciyealci0@gmail.com>
Date: Sun, 9 Jun 2024 06:28:32 +0000
Message-ID: <CABNPNryh8+Gq6gApJwiB82YTOOOq5cQRTWPbEQvwjmtOrT1Ohg@mail.gmail.com>
Subject: [ BUG ] Broken GPU
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000e9be82061a6f2418"
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:52 +0000
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

--000000000000e9be82061a6f2418
Content-Type: text/plain; charset="UTF-8"

I am quite new to mailing lists, and i am aware this may not be the best
format for reporting an issue.

So, on an nvidia gt420 the nouveau driver on kernel 6.9.x do not display.
The issue was with nouveau not being able to display on the card. Using a
older kernel (6.6 LTS) has fixed the problem.

I dont know what else i should add for a issue report, For responding to me
specifically please send an email to me with a urgent tag. (I have a bunch
of junk in the mailbox)

--000000000000e9be82061a6f2418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am quite new to mailing lists, and i am aware this =
may not be the best format for reporting an issue.</div><div><br></div><div=
>So, on an nvidia gt420 the nouveau driver on kernel 6.9.x do not display. =
The issue was with nouveau not being able to display on the card. Using a o=
lder kernel (6.6 LTS) has fixed the problem.</div><div><br></div><div>I don=
t know what else i should add for a issue report, For responding to me spec=
ifically please send an email to me with a urgent tag. (I have a bunch of j=
unk in the mailbox)<br></div></div>

--000000000000e9be82061a6f2418--
