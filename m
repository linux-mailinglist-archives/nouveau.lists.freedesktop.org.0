Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7390227B
	for <lists+nouveau@lfdr.de>; Mon, 10 Jun 2024 15:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4510E2CE;
	Mon, 10 Jun 2024 13:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LHWwsdGE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE51810E332
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jun 2024 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718025216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IrUlnMBlplzCA703kxl5+n8EFJwNGZ15Zmnn7aVwqoE=;
 b=LHWwsdGEBMWfvXO8s/dvF5COy34Vd6r91GulkaBXFx402Z6yrLTbIag3Vtr4JHBiLeoP0n
 KkYRrM1oqCqknWSt+dNDPGrt/1muxxLM9MfGW+P8PlG5IO+urH4LxBUEIfGDY759rryczC
 pAbMyzpIGduG40Sjx6uCPnvPfsUm+jU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-TLRTK616MUaBdO76FLnVuQ-1; Mon, 10 Jun 2024 09:13:34 -0400
X-MC-Unique: TLRTK616MUaBdO76FLnVuQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3580f213373so2580239f8f.3
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jun 2024 06:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718025214; x=1718630014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrUlnMBlplzCA703kxl5+n8EFJwNGZ15Zmnn7aVwqoE=;
 b=vX8oCqJqTBApusPPJJ8vrorNLoLUyRl1Xu1yK68ap34m3jqTIg0kD1nG0b/zq+dAhT
 b45eRaPIEWGbeV1B4qbVhH05NmUMOy4MdnKOshkK6Xq2JaD75LrPjzxbgmPVnSq+YX4h
 vdDBB72Y5LOSGjxIRple+R0mWG270mIj5s9e05yMZs/lHVbdmXC0Bi+fLomMVfI3wzca
 3O8DX/+y76jcCsnHN0woXwX46c0iByAp8amk1R9aDYl88hOaHbUq05JSyTZcl1yFsQdl
 23xBjl5C0WWjxADNpAzHzZmLBPwoc4FkV3gZLXjlSZDWmHOhDrtYmNOoZXDuhtrDOQX6
 0FTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPCIoi+RNJmwmvU4k+2DWlojuUv6GIFx/21knMMRPrOhauoBsL0I6UsPaF660wy13Fd4imTNAtbEzUTVjLX4nSuoIaEzOHUAgulGNFJA==
X-Gm-Message-State: AOJu0YyhQq3HJEHfANdl3eYo5GKb4ttPn3QL74sNzMpM3KaPaEFDlZBo
 kKCYp1Q6KSZCOhlS6BzY+6pF8KFUPwDdJ0FritE0sL3S17IBrbjYBV5KsaTdIfuU+UTAmG9kEKz
 KQadAtV7b2UsK6TLh8KFE5nC8j2kRtMzFpV91Fk44rWcLMoEPCrOe7z4IqNMaw/8=
X-Received: by 2002:a5d:4583:0:b0:35f:296e:4130 with SMTP id
 ffacd0b85a97d-35f296e47a4mr616293f8f.51.1718025213789; 
 Mon, 10 Jun 2024 06:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhD4ZJw9Bi6tM7YL8PTv0XBgcF2TZ2fQnBusYpunX8Pj9IYg7YkjOK/PnV1JA0O8Mqvp52w==
X-Received: by 2002:a5d:4583:0:b0:35f:296e:4130 with SMTP id
 ffacd0b85a97d-35f296e47a4mr616279f8f.51.1718025213460; 
 Mon, 10 Jun 2024 06:13:33 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f23c67e70sm2905168f8f.33.2024.06.10.06.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 06:13:32 -0700 (PDT)
Date: Mon, 10 Jun 2024 15:13:30 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zmb7-jUfxkNd0tJ9@pollux>
References: <ZmMMMyi3uXTFtIae@cassiopeiae>
 <2024060745-palatable-dragging-32d1@gregkh>
 <ZmNJpQbTtFUPOkAJ@cassiopeiae>
 <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Sat, Jun 08, 2024 at 08:28:06AM +0900, FUJITA Tomonori wrote:
> On Fri, 7 Jun 2024 19:55:49 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
> >> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> >> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> >> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> >> > > here, again, let's take this, which will allow the firmware bindings to
> >> > > be resubmitted and hopefully accepted, and we can move forward from
> >> > > there to "real" things like a USB or PCI or even platform device and
> >> > > driver binding stuff.
> >> > 
> >> > In order to continue I propose to send out the following series:
> >> > 
> >> > 1) minimal device and firmware abstractions only
> >> 
> >> Sounds good.
> > 
> > Just a heads-up, I'll probably send this one quite a bit earlier than the other
> > two to make sure to unblock Fujita on their PHY driver.
> 
> Please. The sooner, the better. I need to send the PHY driver with
> these patchse to netdev.

Why do you want to send those patches to netdev?

I think nothing prevents you from sending your PHY driver to netdev. Just add a
note to your series that it depends on those two patches.

How and through which trees things are merged in the end can be figured out by
the corresponding maintainers in the end.

> 
> I'm not sure what the above "minimal device" means. If you send the
> original patch again instead of the patch that Greg already approved
> and the discussion continues, then I proceed with the approved patch.
> 

I'm honestly getting a bit tired of this...

1) I fundamentally disagree that it's a good thing to fork off patches that are
   actively discussed and reviewed on the mailing list with the objective to
   bypass the discussion and the review process. Especially without agreement of
   all involved parties.

2) It's at least questionable to claim that your forked-off patch can be
   considered to be "approved".

3) I really try to help and already confirmed to send out a separate series with
   only the patches you need as well to accelerate things for you.

If you really want to help with that, you are very welcome to get involved in
the discussion and review process. If you don't want to, that is fine too. But
please stop adding confusion to those series by forking off patches.

Besides that, I also don't appreciate your attitude, trying to put some kind of
"ultimatum" on me.

- Danilo

