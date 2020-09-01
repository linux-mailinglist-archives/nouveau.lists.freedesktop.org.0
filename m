Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88144258D29
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 13:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9656E334;
	Tue,  1 Sep 2020 11:06:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034A16E063
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598958381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2yC0WNnKitaLLp6ozkMYxiDp9T3DQtY4vXJNos2bLOY=;
 b=jB30cCCme1ZKVWvWotPLi+cG02Hmb85WuNrjMVl2LHFvBoyA+VDnXdr5AGGfCbDJ1kodHI
 xy2IEYTVIrSWsDUPOLUaOwSxdggo5f/NNQGkGQJjxQ2VAR0uW7ul3sSmW/BI3Z3G0t8bk+
 xcC1ch4baVsRJ+AqYIhT+eI/qpY6b1c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-3t5bKT9TOaezoTHZw2T48Q-1; Tue, 01 Sep 2020 07:05:07 -0400
X-MC-Unique: 3t5bKT9TOaezoTHZw2T48Q-1
Received: by mail-qv1-f72.google.com with SMTP id l18so666616qvq.16
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 04:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yC0WNnKitaLLp6ozkMYxiDp9T3DQtY4vXJNos2bLOY=;
 b=HOXZhZDKlmYTopoCMYEyaRMZnLjfzAro0oikJAdDV/m3nSCJ1B1CTrRkkPUjxeLKs6
 fKIStOvXYYc4Aq8VTJE705/EuCGjimmCz/dbxYCE1jofgbFggCx05Wds+zI15Ciw2f+T
 uDhsdl3lY1E9AhXOefcERsGdng0wcuuA6AqIRzN9/W+zyxM8tHLllLE2N7h01xfn2YqD
 86uz9pPoF7CtsIeGDvpSYoxLWENIZRmtr3zwYpWGNKjnttEgEd/zPRu8qXhI9Awn7ahs
 h6jrkAeMfmli8UlP0VnaSqkvPvWnO8WbBGcbYbJjDuLVkgp58Jj5dBhWXvWJPhTek92f
 2pkw==
X-Gm-Message-State: AOAM533V/zMlItvxFByjWPKGfMvREaRzrFw6ROBgSLWX8oZZzI/pZlwy
 ZA0Zs3R4+haVxhjm14Uvge5TWSZz0NoDh2Ukc4l4g+pQ33itkI3CrwzPM1TeVX+m0xg9opIQK0e
 BhwFdGalDhNCFqGjhQvxsfhqGzm1LLLzdm5Sdf1Rq5Q==
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr1136341qtv.130.1598958306809; 
 Tue, 01 Sep 2020 04:05:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEm7c3e6nTCTG+4OPDIY/MODdnpnGritbMLPnv7Vq0iMlxRk2m777vAPYXonc6LFT8ZzoiPM3WJUPo0Wbncqo=
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr1136314qtv.130.1598958306510; 
 Tue, 01 Sep 2020 04:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
In-Reply-To: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Sep 2020 13:04:55 +0200
Message-ID: <CACO55tvdTRRN-=4NDquvPdP5g416Vo6GuQ_=DpDAsONJaEFSBA@mail.gmail.com>
To: Analabha Roy <hariseldon99@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] VAAPI on GeForce GT 620M
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 9:31 AM Analabha Roy <hariseldon99@gmail.com> wrote:
>
> Hi,
>
> If I am reading the featurematrix right, VAAPI is supported for nouveau on the GeForce650M (my card).
>
> Here is the output of inxi -F
>
> System:    Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64 Console: tty 1 Distro: Ubuntu 18.04.5 LTS
> Machine:   Device: laptop System: SAMSUNG product: 300E4C/300E5C/300E7C v: 0.1 serial: N/A
>            Mobo: SAMSUNG model: NP300E5X-U01IN v: FAB1 serial: N/A
>            UEFI [Legacy]: Phoenix v: P06RAC date: 10/25/2012
> Battery    BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5 Wh (100%)
> CPU:       Dual core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB
>            clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz 3: 905 MHz 4: 927 MHz
> Graphics:  Card-1: Intel 2nd Generation Core Processor Family Integrated Graphics Controller
>            Card-2: NVIDIA GF108M [GeForce GT 620M]
>            Display Server: X.org 1.20.8 driver: i915 tty size: 171x45 Advanced Data: N/A out of X
>
>
> I have installed nouveau, and extracted the firmware from the prop nvidia drivers separately as per instructions on https://nouveau.freedesktop.org/wiki/VideoAcceleration/
> See installed firmware @ https://pastebin.com/Gaqxb88g
>
> But running vainfo yields error: https://pastebin.com/NyULBhXt
>
> Does the error mean that VAAPI is unsupported, or does it indicate a config problem?
>

It does indicate a config problem, but why do you want to use the
nvidia GPU for video accel? I'd rely on intel to provide acceleration
as this also reduces power consumption of the entire system. Also I
think vaapi on the secondary GPU is pretty much untested.

> Thanks,
> AR
> --
> Analabha Roy
> Assistant Professor
> Department of Physics
> The University of Burdwan
> Golapbag Campus, Barddhaman 713104
> West Bengal, India
> Emails: daneel@utexas.edu, aroy@phys.buruniv.ac.in, hariseldon99@gmail.com
> Webpage: http://www.ph.utexas.edu/~daneel/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
