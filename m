Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1417492F
	for <lists+nouveau@lfdr.de>; Sat, 29 Feb 2020 21:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40266E3B0;
	Sat, 29 Feb 2020 20:25:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660F6E3B0
 for <nouveau@lists.freedesktop.org>; Sat, 29 Feb 2020 20:25:17 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id h22so198936uap.13
 for <nouveau@lists.freedesktop.org>; Sat, 29 Feb 2020 12:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aaY3r5+nQ7K6gqJWA+Ow6ttO3o+ToNmE2uiMCqwSqbE=;
 b=iWy4E2fvypkeRLO2XkgLmPraoKD54QqjQZRrmjk9N/s8RDIAbYwNiClZcLRRqgKe5q
 72mQhwQIUfbHHKuEn+jJFKA85lcQui9gf+yvKZH0oXadpsOeqoKrvnW/8kx69A2OGmqm
 LHbzmd4/zen4jQGmSwSf4rZxQxxa/gxMSNfJshgvHrS1vEo/qjcbEBP1A7lN2LLN5WT5
 lKtM8O3AkUQnvEx87PYmMow2UuJRFIQXdhaCA9XRD4BtAZ/vDkNnikJBmCL6hDrSqouD
 7dOw0gwAngGgTWxfbHExffdMGGXEMXv1OSIdZHTt69J8yml0vj8tXYjt63+H1JwH6pQ/
 3MSQ==
X-Gm-Message-State: ANhLgQ0me+pssINeJwLqSZLTG+r06XO1vkXDLnfBAfJ5Fmc2faJgbT3I
 ma/DU+VLx82VnRhaeoiHKQhFD3W+9wZh1ntmf68=
X-Google-Smtp-Source: ADFU+vthJlGUhMbIGvHMju3xOmzJpZiaOF5k5S8A1DasgP2hdfqzbweZzq/KGWz2gmsy5ZAYKAF2mFddkC4iiOk0LD4=
X-Received: by 2002:ab0:3485:: with SMTP id c5mr4792694uar.109.1583007916348; 
 Sat, 29 Feb 2020 12:25:16 -0800 (PST)
MIME-Version: 1.0
References: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0@AM6PR09MB3447.eurprd09.prod.outlook.com>
In-Reply-To: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0@AM6PR09MB3447.eurprd09.prod.outlook.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 29 Feb 2020 15:25:05 -0500
Message-ID: <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ@mail.gmail.com>
To: Juan Manuel Alvarez <alvarez_juanma@hotmail.com>
Subject: Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Can you try to figure out what was updated in the latest updates? My
guess would be that it's actually the software used to display your
desktop/etc which changed.

You can disable all accel by booting with nouveau.noaccel=1.

Cheers,

  -ilia

On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez
<alvarez_juanma@hotmail.com> wrote:
>
> Hello,
>
>
> I use Ubuntu 18.04, since one of the last upgrades I have problems with nouveau drivers.
>
> My screen look like the picture atteched.
>
>
>  [~]$ uname -a
> Linux  5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
>
> [~]$ inxi -Gx
> Graphics:  Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0
>            Display Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution: 1920x1080@60.00hz, 1920x1080@60.00hz
>            OpenGL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render: Yes
>
> I have tried to install Nvidia driver 304.137, but it seems is not supported in Ubuntu 18.04 anymore.
>
>
> Are there any nouveau upgrade (that it is not on Canonical) that fixes this problem?
>
> Or how I can downgrade nouveau driver to any previous one that works fine in ubuntu 18.04 with my graphics card?
>
>
> Regards!
>
> Juanma
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
