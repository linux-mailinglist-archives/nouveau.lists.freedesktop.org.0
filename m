Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1545CD2C77
	for <lists+nouveau@lfdr.de>; Sat, 20 Dec 2025 10:48:26 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6258C10E214;
	Sat, 20 Dec 2025 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CGcab/LD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5ADF34563F;
	Sat, 20 Dec 2025 09:40:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766223649;
 b=MDXCL+WRsIHdMFnDmrQKL2sqogDQrkDPJDOPlGldzcO4VrM6o95nyTbY5sSHy0UJ1ZhQI
 EkXblS4aE0/iC3TGNkD9De2IlKidayhnyKty5WTWsfwLWyevX0KLN0mmzLxGCO2tWh3Suw+
 Jkdol7jfcONygGaHIXWU05lBLTIcCsM+E5yGws6yfEEWW1PV0DY6VIUtAPjEOkueOT+u7sO
 R+UpKvFYDDZMWywnr/DvDfmcS0iSIiGEH0gXjm+qKyNiD7GtlQ9q+oIcUm+L4kUTfQZ4pC8
 p4B9FYGBvT/t8iRtF7ndZkO97+xfOYnrirAhmgIaFBwEQwAevh0LJHrXrQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766223649; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
 b=uCmILFdyMsTBOods/7PFJ2yROvVksM8OWEVry97Ev22zwq1sdGNtZzjCPquJA7/WylikY
 k74NajB7//4SmD6NKJUWXQpPI7oFsm6nEDyM54yb9C4/zvg9CU4PvDd1e/COG5EnhuVlrSL
 A7NYf5f6eXujavcAlyFbLFl8GeFmmuWeSozP/j5G5E4nGk+QPmx87TB7zifjm9mfcJOayvg
 ck1DQIDE+BoPmaPr9X6i6T6Gvt1DTp06LwWAgj4ed+8qc1eQgjj//JKJmTjpYNjwdhGVy3r
 /8EUIJp25CZ0FeLb9MyJTa2L/7lX10sLSFGLk1673VDQKr2/UJQVTZbJK1bQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D522944B89
	for <nouveau@lists.freedesktop.org>; Sat, 20 Dec 2025 09:40:45 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8463A10E20C
	for <nouveau@lists.freedesktop.org>; Sat, 20 Dec 2025 09:48:20 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477c49f273fso32938095e9.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 20 Dec 2025 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224099; x=1766828899;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=CGcab/LD1Tewn2zawoyvHJwlHbVvwkW0if6k+AmAansyAJ7+m8MzZUexgSTdBaDnKa
         QidWwIebPowtugFgromhZvqwN9SyrwdNYnY3aIQgfVsggCMZC4ZFjXo01QB61m2+lJRa
         rVbEGt4RTFAHGL9HeeQa51sr5++RccC7FOPigH7X1ckLec4yXEsI/m9VJbLEM9Z1Rmh+
         i2b3GRKPtwubdppIC9wSkEyb7fmnndkGF6uitC+SPAnPaVXY6QJwSFPT11Vsfhj41B0t
         /a2sgWUaFGtdT/w5rSoxlA4CvXMaWUJMWkVgoCcOlzVpH8is1c3ipnUdVJMLksoseTCk
         AZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224099; x=1766828899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=HVfGNY6Kxkt4FIC/xPHsNVAYQgSoW+HDKksAKXP5sf9qCaevTRA9JKAZXVaziLAdmP
         30iIxatTG8VCoZahWQYSiR/IwC8iSgz5yhUc94+00JFGqjd/jxhDAdymzFBYaZfnUi/c
         ZsY5Mz/8hLfPL6bfUJ7SLDeLRB2kc6F9j0qds3Yp9vjAd9Fp3h5d+Wa/+sIHW/3eymse
         ru97MZMJj8I5NGpE93fn+kzEqgqXYXu/KHp3+qwAlBehQhJOZKvQzakqKbcTv2Kdgny0
         lBft1PK/Aag/1U72kHsUV2GwRXkjK93INoy3+07m6IN4x9ZaYQ9RScGkeqjAqow4gZvG
         ouKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuB/F9Uumk8234oP0ivjy13g873qD8jYcvEesQBnw9pi/2jm3thibE/zx9gCPsHtf2E8TjtnB6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9LmlxHUmBCReFGQIDciYO6iwmmuVhf1zTwczLGPmUJTpW1Zcc
	Rij8GC4dfHv2XQFg+Eep/NWmC6llewzjy/GT1sa+VSSJptlSF/LtnHL80E/XL9SKRprUilZvbfJ
	VkRlo5AgC7ljYH1zCJw==
X-Google-Smtp-Source: 
 AGHT+IF/wwyCbmZKrb9+OJuirDYtRZw2m8SWoZaJ0QqeIqy0vt7I3G/xdsnBsD2ylGONwHmPG8Ly7PYUfnT9IJg=
X-Received: from wmbjp12.prod.google.com
 ([2002:a05:600c:558c:b0:475:decb:4c4d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id
 5b1f17b1804b1-47d195667d6mr53518855e9.10.1766224098608;
 Sat, 20 Dec 2025 01:48:18 -0800 (PST)
Date: Sat, 20 Dec 2025 09:48:17 +0000
In-Reply-To: <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Message-ID: <aUZw4fpWRUWFsb9r@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: LTRWHJ6KTJUHIXNZMZBYQBTBIQMA4VSS
X-Message-ID-Hash: LTRWHJ6KTJUHIXNZMZBYQBTBIQMA4VSS
X-MailFrom: 
 34nBGaQkKBy8LWTNPcjSWRZZRWP.NZXYZfgPLfWTded.QcPPOPdVeZa.ZcR@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LTRWHJ6KTJUHIXNZMZBYQBTBIQMA4VSS/>
Archived-At: <https://lore.freedesktop.org/aUZw4fpWRUWFsb9r@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > +    #[inline]
> > +    pub fn obtain(
> > +        &self,
> > +        obj: &T::Object,
> > +        data: impl PinInit<T::VmBoData>,
> > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > +    }
> 
> Does this method make sense? We usually preallocate a VM_BO, then enter the
> fence signalling critical path and then obtain the VM_BO.

Hmm, but there is something tricky here. When do we add it to the extobj
list, then? If we add it before starting the critical path, then we must
also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
adding it to extobj after signalling the fence seems error prone.

And besides, adding it to the extobj list before the critical path
means that we can have drm_gpuvm_exec_lock() lock the new BO without
having to do anything special - it's simply in the extobj list by the
time we call drm_gpuvm_exec_lock().

> > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > +    #[inline]
> > +    fn deref_mut(&mut self) -> &mut T {
> > +        // SAFETY: By the type invariants we may access `core`.
> > +        unsafe { &mut *self.0.core.get() }
> > +    }
> > +}
> 
> Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> data_mut().

That's fair.

> > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > +    #[inline]
> > +    fn drop(&mut self) {
> > +        // SAFETY: It's safe to perform a deferred put in any context.
> > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> 
> This does not need to be deferred, no?

I think what I *actually* want to call here is

	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);

like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
this series.

> > +    }
> > +}
> > +
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> How is this different from GpuVmBo? The only object that is not in the GEM list
> should be GpuVmBoAlloc, i.e. the preallocated one.

The difference is whether there is pointer indirection or not.

This type is morally an ARef<GpuVm<T>>, except I don't expose any way
to increment the refcount.

Alice
