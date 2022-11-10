Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BF624611
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 16:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4510E3ED;
	Thu, 10 Nov 2022 15:36:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0722910E3ED
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668094592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6zs8T1COMfiwt2o/gkQYNS03PoxsKImW8na1FAPM1F8=;
 b=Kxjpi7EDnAzsOJXt2r1geUZeuP3gC3jw0W/+dPh/+q993j5w8+QJ9aDOX2oImrqRQ7cxOT
 nPx9A4bjl3sQdhxWgXL0Cy6dBDjW4kQg908BZJw3fz6RBaBsZcKJHAcTkp4rohBPeU9wlG
 SqK8EsMBZii8u2BXK/VXOlg4hM/amPs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-TMHjsLTdOBaSFuccMHO5NQ-1; Thu, 10 Nov 2022 10:36:31 -0500
X-MC-Unique: TMHjsLTdOBaSFuccMHO5NQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay43-20020a05620a17ab00b006fa30ed61fdso2236510qkb.5
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 07:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6zs8T1COMfiwt2o/gkQYNS03PoxsKImW8na1FAPM1F8=;
 b=0ySS01SPnQVUX/Z4zyvC4FbIHG0fyDAvKIKtNBPf12aSIe/71OZH5ePzDHB75XnxKR
 SsUiJDfRW6pZWuS0iboiW/A8fS9bY0WTNbhnG7rNL8j/4uQoIz9swE6uXcCdv6yTlAkx
 GX5LFtFkxunQFqFgJEQwj+/mYQx5z1XDwZRSyhKxBQmuUeWBMlQMmY+ggC7zlomdhTfu
 BmyPdRXKVjacIUl7pmlc2X2LpgQu7E11ViUTI+0NuvD4Gk9oVaBbq1CsxciOAcZV76yl
 EsBaMmwGYqJTrknbQtjb8Y4apYjK+dzm1oKDlbTZSBldu2Ku2eQ+URYhUiDLJJ6sPNvt
 sTQQ==
X-Gm-Message-State: ACrzQf3LyZWH1hWlilZbFGrMTyk74XxJro05clDH3xSX77KNBIOf+qJG
 gt31EV2kzJogvaD3hue/kC6GoFdoQ7BF7V2NJdgh6nx/fCgNPA0mKTP4r7QOdTBKebo2W3/RTHd
 mnZs+ZvdbRfuyy4YOOqgen2RvtbGj2jWGQhRPhyd5kg==
X-Received: by 2002:ac8:7756:0:b0:398:5f25:649 with SMTP id
 g22-20020ac87756000000b003985f250649mr1284182qtu.673.1668094590916; 
 Thu, 10 Nov 2022 07:36:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Ec1OVmW5evyndXdIVDbQa8nn5Bqzy8LWGHflgRZFkKKbU5Vb5sRHdvFWirDSO45CvdfdHBRzy/EaBTV41zzg=
X-Received: by 2002:ac8:7756:0:b0:398:5f25:649 with SMTP id
 g22-20020ac87756000000b003985f250649mr1284169qtu.673.1668094590622; Thu, 10
 Nov 2022 07:36:30 -0800 (PST)
MIME-Version: 1.0
References: <tk6dm1$jsm$1@ciao.gmane.io>
 <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
 <3748590b-2863-c998-d8a3-eabd2f65c749@gmail.com>
In-Reply-To: <3748590b-2863-c998-d8a3-eabd2f65c749@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 10 Nov 2022 16:36:19 +0100
Message-ID: <CACO55tug7KB99HvdM=up14Qrqhzz_023xaSUSB37cSCDP8bmAg@mail.gmail.com>
To: Timothy Madden <terminatorul@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Fans ramping up randomly when idle
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
Cc: nouveau@lists.freedesktop.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 4:01 PM Timothy Madden <terminatorul@gmail.com> wrote:
>
> On 11/7/22 13:41, Karol Herbst wrote:
> > On Sat, Nov 5, 2022 at 8:36 PM Timothy Madden <terminatorul@gmail.com> wrote:
> >>
> >> Hello
> >>
> >> My Msi Gaming X Trio 2080 Ti randomly ramps up the fans with no way to recover
> >> (I have to reboot) even when the card is idle or is only showing the desktop.
> >>
> >> This issue happens even when the card is not connected to a monitor.
> >>
> >> My dmesg output from nouveau is included below, I think the last 2 lines are
> >> the relevant ones:
> >> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
> >> [ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
> >>
> >>
> >
> > that's kind of odd, because "nvidia-gpu" implies you might have
> > multiple drivers here? Though .3 should be some USB/UCSI or something
> > related sub device on the GPU and Nvidia might have messed it up
> > (adding the maintainer of the i2c-nvidia-gpu driver on CC).
>
> Is there a way to check for multiple drivers ? I have openSUSE
> Tumbleweed at version 2022-11-08, and I did not install proprietary or
> other NVIDIA drivers.
>
> >
> > Anyway, the fans are probably controlled by the Laptops firmware and
>
> I meant the fans on the graphics card. No laptop here, my desktop
> computer has a Gigabyte X470 Aorus Gaming 5 WiFi motherboard with the
> latest UEFI from gigabyte web site.
>

ah, then I got that part wrong. Okay if that's a desktop GPU, then
it's something we literally can't fix. We require signed firmware in
order to control the fans from a driver side. What you seem to
experience is the GPU doing it itself, because it overheats. Sad part,
we can't change the clock without signed firmware either. What could
help is the new GSP firmware we got, but that's still WIP and would
require you to compile your kernel and fetch a firmware from somewhere
and then it might not even work correctly yet.

> > maybe something goes wrong with the runtime power management feature
> > here, which as far as I can tell works on the Nouveau side, but
> > i2c-nvidia-gpu might prevent the GPU from powering done and so causing
> > more heat. It's also interesting that the GPU runs that hot, but given
> > we don't support changing power states yet in Nouveau (still WIP
> > wiring up the new released firmware from nvidia), not much we can do
> > while the GPU is actually in use at this point.
> >
> >>
>

