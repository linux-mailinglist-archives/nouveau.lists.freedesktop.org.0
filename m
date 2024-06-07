Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E745090044D
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2024 15:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F5010E194;
	Fri,  7 Jun 2024 13:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dn2D4ZxK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAFD10E194
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2024 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717765545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
 b=Dn2D4ZxK6dwAFynapRClYyGH4NnwWVItFPSvsGvIY+hbEy+v25PIVF10CkDt0xzW22EDij
 AX/HLbko6nInDFWOU0L7ymqhyhrOD10Y+meNzyemvkFgilgUjVuc8Wgd33Cb8y+fKLwADg
 sfUKgMscHa34TuIkyLPzW7Car0pBrzw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-NB0SsyvVNoSTmV_q_R5fXw-1; Fri, 07 Jun 2024 09:05:43 -0400
X-MC-Unique: NB0SsyvVNoSTmV_q_R5fXw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35e5b42c85fso1492035f8f.0
 for <nouveau@lists.freedesktop.org>; Fri, 07 Jun 2024 06:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717765540; x=1718370340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
 b=p1HspJWpnpl00R9TodubJ7DWblaVVuDKlOmcV1cq02WLUa9rXYJGtuWfcYWgpoy0VA
 AoL8crP/SZsQIa35IR1N/DA7RVUJdZ7Qva/4JP2mbY39AGBseYZvPBnuvL83muWsJjjy
 sjgXz9LJi7MrNYnZCHdxqMD4HKbMCfJsheBQvbuUgFKcLkoYL7EeD4pEPCe1WMdMU4Ln
 WZOwwtFdcBAxBRBfk2oBz0oNUc+ZgYe+CijU98jUT5+G96JKZNjgdzroz6CuTLXEsUhS
 X5hC4u3OYpG2Ghzgb14jQ18wCvfQGb9dWoCZNh4s36tuv/foaEEl5X5SdWB0tcAZDgpX
 1gog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxcDZzuY89P1hnJjV4EEmqVOyK8kwuVYLyG4q9upCY0NicZY0E1DXs/5P7j2wbbm52VdErdc1q+AJxR5ycpLIlPLk2b7mW/6PKkMdBlA==
X-Gm-Message-State: AOJu0YyS/FJXIbMwFZ7389kS5HlnnwwxoAAZIpqKKiGOp1nqRnq6WKbk
 0lddn3HN1FcemGqXZhFIet7ij3rSlpDGBh9FD4qgQv73AL39CqEmu++fhCLmvnUoQ+70KGi6Qm+
 LTCJ66IkTdz/6u/yGjkyvssnsgINCoIjmfOwqbXZkiCBmkLPaLSVsjx55tNqWBcU=
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id
 ffacd0b85a97d-35f0cd675b6mr608041f8f.7.1717765540448; 
 Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhE9vaemAHFaA5yCK2dCQn83HAZMLlxklLRbU4vCgE337Y15ysZQMtmWhB9+FiRiVoN001pA==
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id
 ffacd0b85a97d-35f0cd675b6mr608011f8f.7.1717765540032; 
 Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d49e43sm4000079f8f.31.2024.06.07.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:05:39 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:05:36 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmMFoHYR8INkhMru@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
MIME-Version: 1.0
In-Reply-To: <2024060708-residue-hardy-af36@gregkh>
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

On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> > Hi,
> > 
> > On Fri, 31 May 2024 11:59:47 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> > 
> > > Once we get to a conclusion I can send a series with only the device and firmare
> > > abstractions such that we can get them in outside of the scope of the reset of
> > > both series to get your driver going.
> > 
> > Since your discussion with Greg seems to continue for a while, let me
> > include the following patch that Greg approved with the next version
> > of the PHY driver patchset.
> 
> Yes, please take this one now.  We can build on it from there.

This patch still contains the points *you* are discussing on the original one.
Why do I spend my time on this discussion if those points don't seem to matter
for you now?

Also, why would we want to have this patch (and the firmware one) in two
separate submissions? If we urgently want to land the firmware abstractions I
can send a separate series with just the device and firmware abstraction
patches.

> 
> I had a meeting yesterday with a lot of rust kernel and userspace people
> at Microsoft and talked a bunch about this and how to move forward.  I
> think we need to take much smaller "steps" and even encourage most
> drivers to start out as a mix of c and rust as there is no real
> "requirement" that a driver be "pure" rust at all.  This should both
> make the interface logic simpler to start with, AND provide a base so
> that people can just write the majority of their driver logic in rust,
> which is where the language "safety" issues are most needed, not in the
> lifecycle rules involving the internal driver model infrastructure.

What do you mean by "drivers to start out as mix of C and Rust".

I don' think this is desireable. Writing abstractions for C core infrastructure
already is a lot of effort and sometimes rather difficult in certain aspects,
(e.g. align lifetimes).

An immediate concern I have is that this is an invitation for drivers to write
their own abstractions, as in interfacing with C core infrastructure in C and
and do a driver specific abstraction.

> 
> Anyway, that's all hand-wavy right now, sorry, to get back to the point
> here, again, let's take this, which will allow the firmware bindings to
> be resubmitted and hopefully accepted, and we can move forward from
> there to "real" things like a USB or PCI or even platform device and
> driver binding stuff.

The abstractions for that are on the list and in the sense of what you say above
for "smaller steps, they are quite minimal. I don't see how we could break this
down even further.

> 
> thanks,
> 
> greg k-h
> 

