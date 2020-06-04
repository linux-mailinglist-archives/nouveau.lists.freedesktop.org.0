Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07861EE832
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 18:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5336E4B3;
	Thu,  4 Jun 2020 16:04:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5946E4B3
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 16:04:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q8so6912408iow.7
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJFlc3Gy04cdlG64ny6cPW6U6TQmqhNoO4dpS7PXknE=;
 b=mTXFKyn4oqGoG+g3Bk47F5MLJHUMSNBsAauKM5ecuDkU7B+iueqgNX19QrxBZF1xdc
 1jAb1wzPtsjLj562LpXyuIrK2dSd+9lXJo+VStIYcvWHRLdlgexGwuJ5v3ZM4IaIM1sw
 JQ16pGfjlhO7byFHQMW95D3FGYwZ6lAr8OUnezIW84s+GABmE7koMXsCZN1fcjIaNKM4
 lmbBUOqZkvbjwkWV9tTkBNJJrMF4jkeuZrSN1hj5/OvT9yPzqbd8EpSIlEpUEPQ107Fd
 Dy5L/xdGR7NtXRX7Gk0LgoptBmgYiEJBnNiV+dN0iSfuXLfO5fCMpPwi9J0GVods6QMg
 1xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJFlc3Gy04cdlG64ny6cPW6U6TQmqhNoO4dpS7PXknE=;
 b=PJlKOEuWyQRUvIR83gZG6d0o9IoTkvhyjjc0n0MiFhhPYPJ55ElvcKXyxP/K8kfVdJ
 1Y//gkP/LGEppf/bNeCCj+ALqicJoISdcRsPGvD8t4sCF23ru6dYNT1AVWOBTd5QuRMW
 EoLZtpXSxyOYC2Web9i2f2NjhBDKQAc4hhqZ1gzRLm+VJr8XybOUdJ2j2lzdyfrN+tQW
 m+TSeoaU89pETXmsYT7udim3BXxfv3vbFuqHEDbFyhLmHdT3mChkIJtjn27UGJSFR6xN
 ZchB3LShTPEdOgdHBUWSoGTpgphYks8jHzz/4Dx5QLuWDttj/YBQubY9Xe7FxqLV9dQb
 KR7A==
X-Gm-Message-State: AOAM532ex2PukOBD5WsJ8IjB8K4a+HKTorn97GOFGsYp0ceC9eLOfq/D
 klelhxT3Y5VAxS568cRqRD6ItNAqDtczHQbleLQ=
X-Google-Smtp-Source: ABdhPJzsd93CWEsJZg8aBgXCPYiR1gAdYYsTgHX8mCO8aV9bTUGmnU9TgkL53rRGtlJz1GDKtDXa5xpLQtoDNnolXmk=
X-Received: by 2002:a6b:b489:: with SMTP id d131mr4695033iof.73.1591286691576; 
 Thu, 04 Jun 2020 09:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
In-Reply-To: <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 18:04:40 +0200
Message-ID: <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
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

Thank you, Ilia

On Thu, Jun 4, 2020 at 5:25 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> There's a lot more firmware files than that ... everything in the
> gp107 directory. Also this would only be necessary if nouveau is built
> into the kernel. The files just have to be available whenever nouveau
> is loaded -- if it's built in, that means the firmware has to be baked
> into the kernel too. If it's loaded from initrd, that means the
> firmware has to be in initrd. If it's loaded after boot, then the
> firmware has to be available after boot.

For the time being I got it working by removing all nouveau selections
in "make menuconfig" and by emerging "x11-drivers/nvidia-drivers"
Version 440.82.

Back on the latest Linux Kernel. Feels great ;).

Linux zenogentoo 5.7.0 #84 SMP Thu Jun 4 17:47:15 CEST 2020 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
