Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0389004FF
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2024 15:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FE310EC3C;
	Fri,  7 Jun 2024 13:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OmAOED+2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EB410EC2D
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2024 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717767227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+o4Snn8oFQsu7dtslzg6tFQsMAWhVAZg3b7dqfcILCE=;
 b=OmAOED+2xBE96xj+Zm06K7iK3eJKGsyOan0WnBuN0UTdEbIcpSA6Al8Wi0pHUnUespFm3K
 yzoK7th3Ue+mHqDXPGJdgxYq7iUAzUPGdBj139ZWH/ffE3SfjgHUtq6yNq1LAudBzs+1yi
 ZiI8Htk6G1rlnywsXzQF+QVNYp/p8RY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-dxLQc7mHOnmKeEeZcOAA_A-1; Fri, 07 Jun 2024 09:33:44 -0400
X-MC-Unique: dxLQc7mHOnmKeEeZcOAA_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4210d151c5bso16933265e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 07 Jun 2024 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717767223; x=1718372023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+o4Snn8oFQsu7dtslzg6tFQsMAWhVAZg3b7dqfcILCE=;
 b=TUAohI8uD9+Crxjuh/isF8KpPGryrr6ZOXDukTTUPi6TRU7mZexN9VwO2+Tb0eHAMf
 RRBad2EjiRCCIRNAM6KEORAbC/q5vXQ6bvO3PR8kwMe9GD6dwN6mvHuv5B8H15UUMseY
 bcVK98tDqaV9C1cXuFq0SUVcz/NnsPO5kh/vycP7avX+eCFKPmvL5s3B3uaK3ptLXGIz
 MpzfXNJPlrYnNCXYJ1KQGsVDeFyYdv+wgFmTxFJFO1RJKKd2gvUZogp+mq/VemtkOetc
 F2+nV3tu1DX3yun7+9j/ndciidwcDhHXJGWXbsebiIbuyLBfFxCuk4lT3mRt26mptBuG
 T8BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsutWRbhFftCsP8qVEKlwj7XXCA0s0hR1qEJ/5/q9yE1PXcCl7b0bJrMmpFIMTHi5dWhANmExSfMbZyiDtGWiP3LwB2uStPfZzJ3ZwTg==
X-Gm-Message-State: AOJu0YxnLKqkzA6K+kjPzXK+b8FIuPiWFp3Am6JwO0eLTD9F3uLQ1+Uu
 tnn/Z7mYyRq4qO6cVQRQ9Zw4Z55n4sBDGaoSzj/YYkoxmgHsqYn3081/aCKQUj6L5TwQbjeeGFE
 s0/FLA/n8dfsiijb7Nfp62KnsIjnKMihbpQ/YwADectGLuKOqWx192/17meuY/sQ=
X-Received: by 2002:a05:600c:1988:b0:421:63f7:7e13 with SMTP id
 5b1f17b1804b1-42164a3aff5mr17600745e9.39.1717767222975; 
 Fri, 07 Jun 2024 06:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlyc8Iq7FHKjZyHqdEDLnYOaqMrcT6qa1tTG8982GfrJ4Fb25SyoED3Bpfv/msW3qFlRA26w==
X-Received: by 2002:a05:600c:1988:b0:421:63f7:7e13 with SMTP id
 5b1f17b1804b1-42164a3aff5mr17600465e9.39.1717767222614; 
 Fri, 07 Jun 2024 06:33:42 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm52696445e9.26.2024.06.07.06.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:33:42 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:33:39 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmMMMyi3uXTFtIae@cassiopeiae>
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
> Anyway, that's all hand-wavy right now, sorry, to get back to the point
> here, again, let's take this, which will allow the firmware bindings to
> be resubmitted and hopefully accepted, and we can move forward from
> there to "real" things like a USB or PCI or even platform device and
> driver binding stuff.

In order to continue I propose to send out the following series:

1) minimal device and firmware abstractions only
2) v2 of all other device / driver, devres and PCI driver abstractions
3) v2 of basic DRM driver abstractions and Nova

The v2 series would contain static driver allocation (in case of DRM even const)
and quite a few more simplifications around `driver::Registration` and
`device::Data`.

Does that make sense?

- Danilo

> 
> thanks,
> 
> greg k-h
> 

