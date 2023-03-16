Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F96BD9C9
	for <lists+nouveau@lfdr.de>; Thu, 16 Mar 2023 21:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898A810E2BC;
	Thu, 16 Mar 2023 20:04:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5215410E2BC
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678997083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1YkkUw1xzN0H+t6nmIolgNOdss2FtKa4Y35b1ItNLc=;
 b=TDnwVldpXtkbPq+E0UuSFSIvtVfQkSqBvFS68qy0aKkW9PALxdDkuIQHy9u4mvTc656zug
 ZcQxCLHguSv4Tl/wz0X+wTzxKMi4BD5aAgL5qUCoEltVrvQqMtWcB2XzBAq7a+KeyTOk0e
 LgiUUbsXTURfK7Q8/53AKP8Ea11u6FA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-UcnJcUmPNiyGypHUqXk-Yg-1; Thu, 16 Mar 2023 16:04:42 -0400
X-MC-Unique: UcnJcUmPNiyGypHUqXk-Yg-1
Received: by mail-lf1-f72.google.com with SMTP id
 b23-20020a0565120b9700b004e83ab0eb22so1205558lfv.20
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 13:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678997080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1YkkUw1xzN0H+t6nmIolgNOdss2FtKa4Y35b1ItNLc=;
 b=e055EKzmPeh0ptMMd/i3cNpqnZWN0YG845TLY/IxjQF+CGQ052/4mp6e0iX0siUU9G
 NyeUFShXjDrcgzkSAkTvyLUwEoF+O67DiIKLe5C4mcSSeT3k18KjxOqdYcZ/o4USb8sC
 cj3+V3PvgjRXdMUrOliFLYv+DwIqHWHsBrSl+LlOZvi6b2yVwBIdTVIywElPz8hR9qsc
 FZUaWw17K3iYAviajKFfoAg1PT7FqhzJOmiNQOo66mRF0S1btR3FXVHTlCE02TQ3Stab
 940ahKyQE+++YhoNpKqd628BPCZ3uHUpvUoJA/qV+o7FLhR2eTJC02cp7ufgENBMU33D
 4NDg==
X-Gm-Message-State: AO0yUKVcAtyh86PD5nG8L0TfsILcK1G3Gg+52r7tmpb6npddCvuqKbBH
 OkcE3HPzFwLxAv8d75ICfEtVL7zwwt6vKJRXBECiARo2jfA8pBVE3Ih7ipl2MNBru99FUy18Fjo
 5gyKF9fehulAfn4mGXo10qjfxUfn5MgoNOXh5OR8WkA==
X-Received: by 2002:ac2:5119:0:b0:4e8:48a4:371a with SMTP id
 q25-20020ac25119000000b004e848a4371amr204714lfb.4.1678997080746; 
 Thu, 16 Mar 2023 13:04:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ESVGatyLU1t8OLqy9yNGj+IlxtLWd6JqntB21b/PRHmA660AZF2JZUMxcn0NnbCSm0lqZ/1lTRpwWO6P5k80=
X-Received: by 2002:ac2:5119:0:b0:4e8:48a4:371a with SMTP id
 q25-20020ac25119000000b004e848a4371amr204710lfb.4.1678997080433; Thu, 16 Mar
 2023 13:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230316143122.2377354-1-kherbst@redhat.com>
 <20230316195037.GA1849341@bhelgaas>
In-Reply-To: <20230316195037.GA1849341@bhelgaas>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 16 Mar 2023 21:04:28 +0100
Message-ID: <CACO55ttHaRCe7zZM1YWm_0EKRmy5YSDyP=Edy=VRbeU-gf-iMg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] PCI: stop spamming info in quirk_nvidia_hda
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 8:57=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Mar 16, 2023 at 03:31:22PM +0100, Karol Herbst wrote:
> > Users kept complaining about those messages and it's a little spammy on
> > prime systems so turn it into a debug print.
>
> What is a "prime system"?
>

Laptops with a iGPU + Nvidia Setup. That tech is usually marketed as
"Nvidia Optimus" and people in the open source world made "prime" out
of that, mostly in the context of "prime offloading".

> I'm a little surprised that users would really care about the message.
> But I do see comments like these:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1836308/comments/15
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2002206
> that suggest the message happens frequently, maybe if we're resuming
> the controller after runtime suspend?
>

Yes, that happens every time the discrete Nvidia GPU gets runtime resumed.

> Maybe this should be a pci_info_once() sort of thing?  I think there's
> some value in knowing that we're changing the BIOS configuration
> outside the purview of a driver, since I assume BIOS had some reason
> for hiding the HDA controller.
>

fair point. Most of the bugs happen on the first runtime resume
already, so if that one is good, it's unlikely the system will hit a
bug later on.

> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: linux-pci@vger.kernel.org
> > Cc: nouveau@lists.freedesktop.org
> > Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/pci/quirks.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 44cab813bf951..b10c77bbe4716 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -5549,7 +5549,7 @@ static void quirk_nvidia_hda(struct pci_dev *gpu)
> >       if (val & BIT(25))
> >               return;
> >
> > -     pci_info(gpu, "Enabling HDA controller\n");
> > +     pci_dbg(gpu, "Enabling HDA controller\n");
> >       pci_write_config_dword(gpu, 0x488, val | BIT(25));
> >
> >       /* The GPU becomes a multi-function device when the HDA is enable=
d */
> > --
> > 2.39.2
> >
>

