Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BA1EE87E
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 18:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912776E50C;
	Thu,  4 Jun 2020 16:23:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2E6E50C
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 16:23:12 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id 9so6610451ilg.12
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/GRXkiutQ0OiMBz/RDf/VErChPNVnMHFHfioHFyETw=;
 b=VdaSh4TffgpMA22mnujk+jfEP9ISHVNNmKYoHTDHZjOYV9dkuA6O8hcaYaRAQt2Dwn
 n3bEn0gpLoOO64aRDk19rC2g5dDxkBGA+YtzmCN3HWyyK5cRl53nOB+1rIAA+X86OZFz
 wgLWDODj1HuoZTrOFidSdu3/MSBPaocv/mnV7UuhWLREHXjGGF1d0hUFgIcn+XvyEkR7
 eKWYCclOtQMHG9oFEcEzJjuI37WFgVdVIWpSuraW034yLL9n2hugtahUIxblLG675MzG
 pGfsVTH2NHLAkPYaW2TLCxW7ZRTRBV1TFPkqXRtXkh77FOjUPWM6Y+hLpSO/kPxCMT+1
 HWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/GRXkiutQ0OiMBz/RDf/VErChPNVnMHFHfioHFyETw=;
 b=jLXcBnwnwxQV8Ufrgv2bqdTajCgB7z4KFKW8FufZJyj7Mups2GJgYD3P2WsWIEVjYp
 JaOSmlbC5Y85BBAayVIW8k0fPNJwTAUBWTGGrkGQgOuN4IahNLvV316neonXVyEFV0Xr
 lPlH0ELlI6JByFfGSfDd9AKhZXtfGXImJf/QwmpXtiwtaBcDXI1DISgOC6pSuJCKvE0A
 LpRGcA1yqGI+85Yro5WhLy8cnItAzzZMpx5IjYde6dBnCCigELcG48fgkya6ZFM+ozUh
 Dtw/LIKSVDkIW4U9FVDOcQSNEvU5xvkYVFzWx2Vi3aoH0igkM4woyZld8bojQDDa7XOU
 Io/Q==
X-Gm-Message-State: AOAM531B1Iy7aGreZDV7e4+iMYSnvfrAxLOhP5aelec3xQgxscGeIY6R
 5Xdq74QVNY6u1HaVZCsNWRjjU0zFEwHiJj859zQ=
X-Google-Smtp-Source: ABdhPJwRIle7DTqSdHm9ye9kZyCUQC5nRCg5793eo+4tSVcfiLbB9sQMEQBVf+pKMyeDaTgXCOiWtoQQTM3gR1AcbaY=
X-Received: by 2002:a92:db0b:: with SMTP id b11mr4584771iln.90.1591287791978; 
 Thu, 04 Jun 2020 09:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
 <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
In-Reply-To: <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 18:23:00 +0200
Message-ID: <CAOkhzLV3zpzh4dKOxYUT6a_-kQQyxBxexY0MML4t4LZLK8dOpw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 6:13 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Not sure why you bother asking questions when you're just going to
> dump nouveau anyways. This is the second time I've answered your
> questions on this very topic, I think it'll be the last too.

Actually, what I will try next is emerging
"x11-drivers/xf86-video-nouveau" Version-1.0.15-r1. It that works for
Nvidia, I guess it will also work for Nouveau. ;)

I would have preferred to have it all in the Kernel but that does not
seem possible.

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
