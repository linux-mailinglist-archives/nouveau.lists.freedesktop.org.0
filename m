Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1E8D4599
	for <lists+nouveau@lfdr.de>; Thu, 30 May 2024 08:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698BA11A08B;
	Thu, 30 May 2024 06:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GP7OeL3h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFBC11A08B
 for <nouveau@lists.freedesktop.org>; Thu, 30 May 2024 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717051654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
 b=GP7OeL3hmIMP8m0uPSDI438/4iDF0tmNAm32ezfsAnpj/wF2zMkVc0MB4LOl4f0FM+mMI/
 pkqtJp09Hvohda2E/M08QzBTwvE/ttD4oTlmIT/BfdtzRrYb0hWbOjNZLyy7Ms8EW8pf7C
 Uo9Ys4NCJDxVO8Q7E6QMO+grSYusC94=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-vEqWF_4WMMqF_dm7WWHdWw-1; Thu, 30 May 2024 02:47:33 -0400
X-MC-Unique: vEqWF_4WMMqF_dm7WWHdWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3580f213373so430509f8f.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 May 2024 23:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717051648; x=1717656448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
 b=Vu5DTBnKdow3IvygwQV2LQu1+g6KXN/r+OltO7tGX2Im4g9YDNESSdPfUybvTPZCiW
 IoG9ZEP7MZ9t8a0OrWnLwzn1a1sSngd7jw9fkxFnyT43tCrJJUP20Et2KdOFdnPepbr3
 ALfRgMSPKGUToeI8fhWoWMgiYu8sZtsXfXaO5Z+zqtVFaDRwHhY9ywFQZ4/X/WUwJviO
 BC/UqGBnS+cHlDBbSkx1ie5xyl5JfqvQaX7WZvOQ2cr3Qo7hyLBt7iWCSHS5QT7GyqBx
 wWdD9tkKSJTnRnAbLGUw0c0j43m3ACtXhheUXE6+5HRdRYiTUOct1QU4s3MzTrY2+5kC
 ODaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE8nhNU1K12bBQpEADy+q/RfbNSkOT5u82f3OTy2tAeDORX/OoXNgimLhzZKmvJT1UxxLm6QeTSpUgonvm+nEU/VTjP4uDkdcYzINOSA==
X-Gm-Message-State: AOJu0Yy9OagoDJLvMRg23SEvc1lSxk83J7WxN65RMwtxjIV3AnL0ZTvr
 8VF0P1gIuFVlXoL/eVhpS81Qbd9g1kQkAjC9UsV6pBwe1GDzkrYpBv2FxwRN0cu5K9VwgKhXe/F
 ITw6J0BuiIE1qg05QoEBZQxpnD2MZIONNUg+nTnD98XQUCq2QlyvrUNeV2dKlhdY=
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id
 ffacd0b85a97d-35dc0091881mr968720f8f.19.1717051648549; 
 Wed, 29 May 2024 23:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2THkDfZkgav7wfIpmSg8axTLOU7esgmVr44vwAJ61wnkwr2ymTrnaq1t0RgEDsR5qCuZd2A==
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id
 ffacd0b85a97d-35dc0091881mr968678f8f.19.1717051648049; 
 Wed, 29 May 2024 23:47:28 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7d963sm16775384f8f.21.2024.05.29.23.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 23:47:27 -0700 (PDT)
Date: Thu, 30 May 2024 08:47:25 +0200
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
Message-ID: <Zlgg_Q5y3Q99Ts1s@pollux>
References: <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
 <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
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

On Thu, May 30, 2024 at 01:24:33PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Thu, 30 May 2024 04:01:39 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
> >> Hi,
> >> 
> >> On Wed, 29 May 2024 21:57:03 +0200
> >> Greg KH <gregkh@linuxfoundation.org> wrote:
> >> 
> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> >> device object of C's PHY device during the probe callback. The driver
> >> >> creates a Rust device object to wrap the C pointer to the C's device
> >> >> object and passes it to the firmware abstractions. The firmware
> >> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> >> function to load firmware, returns the result.
> >> >> 
> >> >> You have concerns about the simple code like the following?
> >> >> 
> >> >> 
> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> >> new file mode 100644
> >> >> index 000000000000..6144437984a9
> >> >> --- /dev/null
> >> >> +++ b/rust/kernel/device.rs
> >> >> @@ -0,0 +1,30 @@
> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> +
> >> >> +//! Generic devices that are part of the kernel's driver model.
> >> >> +//!
> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> >> +
> >> >> +use crate::types::Opaque;
> >> >> +
> >> >> +#[repr(transparent)]
> >> >> +pub struct Device(Opaque<bindings::device>);
> >> >> +
> >> >> +impl Device {
> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> >> +    ///
> >> >> +    /// # Safety
> >> >> +    ///
> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> >> > 
> >> > If the following rust code does what this comment says, then sure, I'm
> >> > ok with it for now if it helps you all out with stuff like the firmware
> >> > interface for the phy rust code.
> >> 
> >> Great, thanks a lot!
> >> 
> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
> >> for the firmware abstractions?
> > 
> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
> > directly? AFAICS, we'd only need the following fix:
> > 
> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> The difference is that your patch touches the reference count of a
> struct device. My patch doesn't.
> 
> The following part in your patch allows the rust code to freely play
> with the reference count of a struct device. Your Rust drm driver
> interact with the reference count in a different way than C's drm
> drivers if I understand correctly. I'm not sure that Greg will be
> convinenced with that approach.

I don't see how this is different than what we do in C. If you (for whatever
reason) want to keep a pointer to a struct device you should make sure to
increase the reference count of this device, such that it can't get freed for
the time being.

This is a 1:1 representation of that and conceptually identical.

> 
> +// SAFETY: Instances of `Device` are always ref-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
> +        unsafe { bindings::get_device(self.as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
> +    }
> +}
> 
> The following comments give the impression that Rust abstractions
> wrongly interact with the reference count; callers check out the
> reference counter. Nobody should do that.

No, saying that the caller must ensure that the device "has a non-zero reference
count" is a perfectly valid requirement.

It doensn't mean that the calling code has to peek the actual reference count,
but it means that it must be ensured that while we try to increase the reference
count it can't drop to zero unexpectedly.

Your patch, as a subset of this one, has the same requirements as listed below.

> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
> +    /// the entire duration when the returned reference exists.
> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
> +        // SAFETY: Guaranteed by the safety requirements of the function.
> +        unsafe { &*ptr.cast() }
> +    }
> 

