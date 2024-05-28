Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD908D1C87
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 15:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BD310E2AC;
	Tue, 28 May 2024 13:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hEOTISsL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148110E0E7
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716902280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
 b=hEOTISsL6/y1Mlg3giMUbEKquAu+HH+x2lURo9bF6V6VVjVEr4D6nSXhs1nBbhj1Ti9E5T
 j/oycLofheWl3AXOU58W4m0HfDOyKy54dmw6kUfA98/tZbU9Eq9HqqYY5siXH9NNOLJ831
 U0UD3Q/nJUc4EKALszrpblL2WY4XwEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-KG7p2U-bOJODqq0oSCf2CQ-1; Tue, 28 May 2024 09:17:56 -0400
X-MC-Unique: KG7p2U-bOJODqq0oSCf2CQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4210dea6b97so4921805e9.3
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 06:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716902273; x=1717507073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
 b=Co12d6f/opc1Xz116qz9M90rBG9oZgGc3mauIHGKhKLby2ymGZEqrwjnJJwz9hmXJk
 WHDfwHmfULnw6DLMW86mpRwhpQu3CXg6wfbdKCA4Jka7R451snTFLsUtgY1JyiiFMDci
 uVSmwo/Ld30SVldCzybm2K6FFsbjKyWVRfEqt2DZNs3z/dy2V8qHNtuEDKZtJIBQRWTa
 w6qecUUQjBRERvSNBC89apdkraaFVuJ8NwoccsqlJhnWPdKL78oELZhqbAavi6TBK2V/
 Q4ZOmQSBRI3bXi3hyK8uLse/YA5AlnM95urwVfHDTl235RNhhJcrvKFI8JRMip2UoyoS
 nmMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTiymrmjziW/mHA3Sw9FLgT4HMd1ehA3RaeEK9xSzp/bGxHFCRCkANt86uncajpJSkCdxJW93kFi/lzvxSgDVht7x8Q7dY5JjZa4NFVA==
X-Gm-Message-State: AOJu0YxSUh6Tj9Jr6SP09/JeB8bIY+qzk+WXjKeoMa8GPliCsg/Qe74x
 Vz8lmeA6xR1WIQkVxe/uR83tMQMMxCPW3oczZjmhkibL6v1S7fUCji9Bx4ggrgau86lS6E2fVQS
 nPpiEPvQQiDAELzr+nqlhqQsM1uMExIf42m7WNWiIpbDb5U1TCKMr2o32ypkVAic=
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id
 5b1f17b1804b1-42108a5965fmr80598525e9.14.1716902273650; 
 Tue, 28 May 2024 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeoUSYJdlcKYm+2Dyn96J9Jaogyqz0LroLG0mk080drd07yOfZ4belYxCkfOPHgHjsh1EdZQ==
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id
 5b1f17b1804b1-42108a5965fmr80598225e9.14.1716902273213; 
 Tue, 28 May 2024 06:17:53 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f1410csm174063405e9.15.2024.05.28.06.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:17:52 -0700 (PDT)
Date: Tue, 28 May 2024 15:17:50 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXZfgdZkBveaUJ1@pollux>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
 <2024052816-makeshift-irrigate-cef5@gregkh>
MIME-Version: 1.0
In-Reply-To: <2024052816-makeshift-irrigate-cef5@gregkh>
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

On Tue, May 28, 2024 at 02:45:02PM +0200, Greg KH wrote:
> On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> > However, if you have a driver that needs the firmware abstractions, I would be
> > surprised if there were any hesitations to already merge the minimum device
> > abstractions [1] and this one (once reviewed) without the rest. At least there
> > aren't any from my side.
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> No, the device abstractions are NOT ready for merging just yet, sorry,
> if for no other reason than a non-RFC has never been posted :)

I did not say they are ready. I said that I'd be surprised if we couldn't merge
[1] once it is ready even without the rest being ready. :)

> 
> greg k-h
> 

