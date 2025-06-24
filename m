Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C9AE6F12
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 21:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5910E07C;
	Tue, 24 Jun 2025 19:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="RIhojTwg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E38810E07C
 for <nouveau@lists.freedesktop.org>; Tue, 24 Jun 2025 19:02:20 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so2794448a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 24 Jun 2025 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750791739;
 x=1751396539; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOEBbrADQgzhdpcNHy/4llsfpBt94yq3hHv840kQQcw=;
 b=RIhojTwgbaVugN04ydj3t8SeacaFDyOog3dCS8He1vH07ahkCtxXphpWhJp1/zYGlI
 0YJ0X0h374xJXJ2fq4kLZpxa3kUPr4y+ZzjTipDIlVRDnWquIslMspxr4XNNNAAIpM5t
 in1OGpXPLYQ+ysSGDhrzHAJvIhz010k7BMag2jU74XLppPNrmc7NmThp5nJ6NOuie2Z6
 YoRP2em9IS15PDrL8F7RmwKcn93rOBbMTXDcbEA75TRbiLTyJBjWFABXufekNDIlonAV
 j1BaplnpiqBX8bXVtO1pZ3TGREcXCSKUsjFNjMLB01FLxO998tPB0KIWY76CjBwoMBl+
 JkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750791739; x=1751396539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOEBbrADQgzhdpcNHy/4llsfpBt94yq3hHv840kQQcw=;
 b=HgE3UMM4YY7SNDcL29p7PnoM/lJKY342mmkya25gDVcLLcYUukpIufkkmCFVQXXemm
 s6ipVdZTwzv7mh+bA4UUkplrb+zfHWkFxPOhPshhJeGv5qO6KPPGl5kTF1WXJu85O4qn
 UctDt6nSgLrJb6RGPF+El9mS2TpJuTq5RS6Jtow80gp30+rsc2kbxpXX1tANOukdhKRT
 04dYp5TAiybpRptH3IcwO5dS1+iZVq0VlBBvBWOmtWhfFnMN6YE644mvBw3FLLhkmHuT
 ZsW1ywM5X5dxKGsWZVGu3AwRc2krCShFELWpNixU7XFH7lGKc3y8AehejZCxgE0V+wDb
 PNGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDOaVxrLxBr6D+Ryg3WBGLKlJpG7d3TlM+pYVGClkgMNhD4/XHnW6XVkpszve+/hVzg77vQxVQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyddN9OkN7z7xpewGDpxcDwQ+1EfxLGyQS6ueH6o9vQLNMDTAsL
 JZb8E2gV8sAaLPz8cBvFZNEZCIz+lpPUEB3cxFzu5O6ad0wJmJIa6qBtyNOUPSNGJjCemmSnO9X
 wtrMCuF5iDUAetY2pLJ4GyvFKw7So8XYbty04FEj42g==
X-Gm-Gg: ASbGncsqxrMY+RzHp0CdsuCYJIqLzbBmbcCWnS6DTg6X2pj8OD0p5AQ2K314rgEEgdZ
 1zA7WwhFiCFlg9GI8TvQ25/jP17JGv/QCg6J/z/zWJ0QASiQHuR3a6hw9xE5gHmEb5dtdkk04r4
 iy/0wkEt/ZGDdDFoGv9CYA63zCxYY2Ai2ECZ/4xqKAvg==
X-Google-Smtp-Source: AGHT+IHnYVBDxfjNMkaRjkp2WDZAMTuXpl+FheJSZE/dsI2zOIp9CBkUlB5OGffUxVoy74ANKWUopMt/2c8mfchZ0D4=
X-Received: by 2002:a05:6402:270e:b0:5fd:1c90:e5cd with SMTP id
 4fb4d7f45d1cf-60a1d1675f3mr15598180a12.20.1750791738700; Tue, 24 Jun 2025
 12:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
In-Reply-To: <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 24 Jun 2025 15:01:52 -0400
X-Gm-Features: Ac12FXxGdqiSvrynH_XGlD-JBUIhlFJwwCsvqvoZCeN_08f20dGpPGbh6hbgAi4
Message-ID: <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: Timur Tabi <ttabi@nvidia.com>
Cc: "martin.peres@free.fr" <martin.peres@free.fr>,
 "kherbst@redhat.com" <kherbst@redhat.com>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 "lyude@redhat.com" <lyude@redhat.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 24, 2025 at 1:28=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
> Instead of removing it, I think we should rename it to indicate whether G=
SP-RM is required.  You
> cannot boot Ada or later without GSP-RM, so on those platforms, nouveau.c=
onfig=3DNvGspRm=3D0 should be
> ignored, and a pr_warn should be issued that it is being ignored.

We did no such error checking before this series (in fact, most of
these options have almost no error checking). Are you saying you want
to see this added in this patch series?
