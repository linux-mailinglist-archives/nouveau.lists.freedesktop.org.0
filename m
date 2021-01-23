Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3E3018D6
	for <lists+nouveau@lfdr.de>; Sun, 24 Jan 2021 00:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346E96E223;
	Sat, 23 Jan 2021 23:13:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214D6E223
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 23:13:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m22so12671884lfg.5
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uipJxFP4qvFryMMFnd/vaX5g+Y5mCiAlBU9DJqHOLs0=;
 b=KLdTzsArH4LYC+suW8aLCVFmGdogR+6G8o4xdJxoRldXL5FDBlSufHgamvlosL3WsL
 HXwmG6Cc3p6qtp83RnwpyHMt66mKyg8C3tadC0MXjw4fWej8+BXj8WbzGfNqKE0Dk5Nh
 sTu4vkvh4BTz/sHYgeYMtBtYxLvtTJ7lKKfqCLOVrVfYwYkhuUZCLPraE8tjr2jDRMiJ
 t72cJhYFlcUJdpasYe3MSAFfXrVIdo5jBTvGFrwZnL7aBwpjU9Z2wJ2EVxMM3Li57kEE
 vglHDsFkZ/DblTc59qORw3x9DRACTtf9n61XfQg1l/FlCCWUggmiWCU60kGYhjXA9hgV
 NnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uipJxFP4qvFryMMFnd/vaX5g+Y5mCiAlBU9DJqHOLs0=;
 b=pEMgXYWyK+0v8d1XMhwp52x/hshupNCLggEKiEOYu1Nce+h+oEjLmAqkcikt7vcTyS
 DXDUkK3W1psw4s/Y/fDtUggMCqkhZIHHDXm9HpsNkfW3Ff/bK3Ejcu7GJ9wdLSQ9/ycn
 hT56y1tgqwtk+KGcp3p74WP264eH+G4objNuyQ7ujEPScpd76wqqX5XO82xghEvl9FIS
 ZZIS6San6nCCFnNrzKmftXP43FX0zGtdAYeZWvntxmYomZNbdXOu6H40jlYPLFXMeZhM
 Qy7/XVeBLYA8ipLffVbviF1VyIUZJpzIxspiSRaGrPSJOUNE4Z/FkmFVFUi11AoYUjRI
 zfzA==
X-Gm-Message-State: AOAM5317ylxQ+fK3jyZLM6fTZHzk7Py0uoxx0ZAjlftF0JNks6TGAZ6+
 Wn89wbFHhYPKWIpUbHPcPp0OiJiT8uKyFWlB/vo=
X-Google-Smtp-Source: ABdhPJxEV7wNMkyYur57NY488UpB8wyZD79+5ru6Txv+L25yN1lQ+SVa1mqLmndjFif0c3o1kNWThB/OWlS1Yp1gHHg=
X-Received: by 2002:a19:a40c:: with SMTP id q12mr17778lfc.103.1611443586802;
 Sat, 23 Jan 2021 15:13:06 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
In-Reply-To: <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Sat, 23 Jan 2021 17:12:31 -0600
Message-ID: <CAPpdf58m1q+dH1A6cb9WfgRjbz4Fa-fSRU73piPnhNqTgufGtA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] Request for help in adding a HDMI output
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

On Sat, Jan 23, 2021 at 12:52 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
snip
> Well, I knew it was for secondary GPU. Based on your comments, that
> was the 570. I shouldn't have assumed that to be accurate, that's my
> bad. I know it's the secondary because the output is named HDMI-1-2.
> That means it's on a secondary device. If it were primary, it would
> have been like HDMI-1 or HDMI-2.
>
Understand now - - - - but don't get why HDMI-1-2 is connected and
I can't get HDMI-1 to connect.

> Perhaps not all the HDMI ports on the device are HDMI 2.0-capable? Or
> perhaps not all of them are on the GPU? What I'm seeing is the monitor
> reporting a max TMDS of 300mhz, which is not enough for 4k@60. However
> 4k@30 should work just fine out of the box.
>
https://rog.asus.com/ca-en/graphics-cards/graphics-cards/rog-strix/rog-strix-gtx1050ti-4g-gaming-model/spec/

for the graphics card - - - -HDMI2.0b (native) is what's listed.

(Forgot this info on the previous missive.)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
