Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE523D46FA
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 11:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD8D6E0C5;
	Sat, 24 Jul 2021 09:54:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CA16E0C5
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627120486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4c+xqVW7MfBsa5VDqyOX8qekDnp6U6DnRr3TNr1ss8g=;
 b=WxPlGU7e2lBai5ITzm77DQ7UNCjTi5orFn0hz3FLjQODnRZoQM6bgpJMXyJxtrdaoIamW7
 Kzw1mz6txK7J0FPnUXhb91z5HT5faUnsFWaQatEGQPaf+j3s3tRe/DuvIr0O+NKwxsWNER
 tNxj7Gbz9Wzc3NYD7+HBB8HyCGUPUUM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-2r58OpyWOL2f7ZprSZp47A-1; Sat, 24 Jul 2021 05:54:42 -0400
X-MC-Unique: 2r58OpyWOL2f7ZprSZp47A-1
Received: by mail-wm1-f72.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so115707wmc.1
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 02:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4c+xqVW7MfBsa5VDqyOX8qekDnp6U6DnRr3TNr1ss8g=;
 b=A+FHTEQkZte6gWrID/3z/a4kcyDhUcVqL4BGO2F7Ykv3Rqc0fVSifpE4j8XUvwE1dW
 IDGZlpa6D6s/oNvOZPbhkySLA7S36m+EM+6l5YNrsusaa4k74fRdwUytg89L1E4Pkav+
 csEOMbANMtrMJhM+NmqmoUP6QbZXL+odckYiWoSgLddq1wk/JihUYz1pOn0I15ywzF4Q
 IkF8loiVN6DnvIuf1dT+3D85qMCHluSIwzrhgvcwKfyHshzhpxKFPpTCaX425Zj1njwn
 5YgSI1KSoO4GqFjCIitLRkVfXkQ0RQJMagqheh+xkBfO7FMM4mur3wV9JKXS/81kAStV
 rQbw==
X-Gm-Message-State: AOAM5337kxIlH3tyRr8kv3pW6e3YBsQ9n9pAmre2Yw5EZzHd9Pw2gr0L
 zaeXIoGvFOntm8fh8/hj3DgXadIRrj5E6AQjHlOFFWq8XKmi3+DgqgCuceXqa/Rx/f7qPaX23Xs
 PYfBq/Z1J1hcEQYtlT9OYw9l+KfxN4r0qDwcf/MUULQ==
X-Received: by 2002:adf:a148:: with SMTP id r8mr8978529wrr.415.1627120481323; 
 Sat, 24 Jul 2021 02:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwwMalzdNDmZeupmmuzGaDQDj9isYPnXIp/RVrPJIn29iuFfmxbG0uKGKcUX72MK2H2D25PbjolghFSWdAD9M=
X-Received: by 2002:adf:a148:: with SMTP id r8mr8978515wrr.415.1627120481145; 
 Sat, 24 Jul 2021 02:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
In-Reply-To: <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 11:54:30 +0200
Message-ID: <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] nouveau: make backlight support non optional
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > In the past this only led to compilation issues. Also the small amount of
> > extra .text shouldn't really matter compared to the entire nouveau driver
> > anyway.
> >
>
> >         select DRM_TTM_HELPER
> > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > +       select BACKLIGHT_CLASS_DEVICE
> > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> >         select X86_PLATFORM_DEVICES if ACPI && X86
> >         select ACPI_WMI if ACPI && X86
>
> I think the logic needs to be the reverse: instead of 'select
> BACKLIGHT_CLASS_DEVICE',
> this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
>
> We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
>

yeah.. not sure. I tested it locally (config without backlight
enabled) and olddefconfig just worked. I think the problem with
"depends" is that the user needs to enable backlight support first
before even seeing nouveau and I don't know if that makes sense. But
maybe "default" is indeed helping here in this case.

> The rest of the patch looks good to me.
>
>        Arnd
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
