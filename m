Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAFAD3972D
	for <lists+nouveau@lfdr.de>; Sun, 18 Jan 2026 15:36:24 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E65310E2D3;
	Sun, 18 Jan 2026 14:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dpXshR4h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 68F7044CAB;
	Sun, 18 Jan 2026 14:27:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768746461;
 b=RPa7T4Pe5G9C/+S2+otYCsaZJC/3Dgrwl8Z00MTmyiBUNR/2pvMrvJ4STMK3Bbau/KPWD
 KR90EDrDcbRHXVw58SQLJkwxFzSVlOjprVeEhxTEZlzQ1VVYZojwRbxlYJkbMuzS29vAjt7
 IQIug+CTfFYZpadanASce6KkCVFRzbc9/yahsJ0Ur34l/7I6yD+tIPcD5IVEQSITHoNB549
 7PxC86DLv0BaXaneZzRSBGdp+qDR8TVuG1qdTy6R3dbmDumvKpFwC+hAqGAYu+LbKge/sl5
 ENodtpn9Er7CpmPaqi0vV9S6K2xJvHHQAA0N5yf2k3Ij8hxHbiECL1U8cz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768746461; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=243XYxPD4Nr0yXcPAF9A5jUT1fmE6zGBiFFlMIvJxvw=;
 b=VVdDGS2I2e50PXreg1BM5vXts3TgctpqjeQD1AZN8SXVraOOYF8Y/54razMf3/AJYc+yL
 YaRuef0nNkGWAc9uDbe8TzArr+qCzvp25QWtsuWr+RJ60vbw6Lx54ut5WBiQNvpidIPaPwZ
 ywj65PLtbOKcy6/BtWcpK9xxI67s1za3xKf1+mwb/DGbX6IRJ2HMMQwbhamrdjEpPY4vFBj
 Plo57ZHzThk8Xb9SgTadit1uEUDgOZDomwX3hwBvlR5L5Gkuz2dufi/AivvMON0FWm/sIQP
 E0HfoQvPFXkBMjdu8qXx7FG4XQdOK2CNL17tSKct68I4aC8Nh6ENmF/4XHIQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 41A91439BD
	for <nouveau@lists.freedesktop.org>; Sun, 18 Jan 2026 14:27:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B510E2CB;
	Sun, 18 Jan 2026 14:36:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCE3F43ABC;
	Sun, 18 Jan 2026 14:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53DDC116D0;
	Sun, 18 Jan 2026 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768746977;
	bh=33hSF7vZvBt9hpj11PH/qOK78BNtuiOFwFzHcWTHKGs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dpXshR4hP1Uedl3csIEZzc8pB6piBF2OUIe80AqEQbPSXr8U6nOJJTJgQo7q9J+oc
	 txtdGHKW365ZRdZMsmTnCK1Wj4aDchYwxWWRgb2rc54N2Qd4tErlIX9LlR6xitKcN1
	 eV8z8QL+tcVLJxRFQhwhLALUuRNTA+kk8StX9XCfAlTMDSchYUkYyScaIBt/KmnVIf
	 W0bj0CVPVLbFlgT34tWVhYHnf+cm8FAcUfBVqq/ycGU9z7yUgJZKbx3PlpQqUhRHuN
	 XbHpnt+Of98+DF1pBupltso1u/xqd8ZdqCIe0O5nr1dOyw1LtSZCVh03u30E2+8GT0
	 /PbRrLBXvZJSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 15:36:13 +0100
Message-Id: <DFRSH2462TT2.RZBLN08KS0IW@kernel.org>
Subject: Re: [PATCH v2 2/3] rust/drm: Don't setup private driver data until
 registration
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116204728.725579-1-lyude@redhat.com>
 <20260116204728.725579-3-lyude@redhat.com>
In-Reply-To: <20260116204728.725579-3-lyude@redhat.com>
Message-ID-Hash: 6VIRZTERM3MT33K2RUMEEFHXWJOB4OIV
X-Message-ID-Hash: 6VIRZTERM3MT33K2RUMEEFHXWJOB4OIV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6VIRZTERM3MT33K2RUMEEFHXWJOB4OIV/>
Archived-At: 
 <https://lore.freedesktop.org/DFRSH2462TT2.RZBLN08KS0IW@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 9:41 PM CET, Lyude Paul wrote:
> @@ -118,7 +120,7 @@ pub trait DeviceContext: Sealed + Send + Sync {}
>  ///
>  /// The device in `self.0` is guaranteed to be a newly created [`Device`=
] that has not yet been
>  /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, N=
otThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) ARef<Device<T, =
Uninit>>, NotThreadSafe);
> =20
>  impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>      type Target =3D Device<T, Uninit>;
> @@ -165,7 +167,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>      /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>      ///
>      /// This can be used to create a [`Registration`](kernel::drm::Regis=
tration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>)=
 -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>          // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence =
ensure a `kmalloc()`
>          // compatible `Layout`.
>          let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -184,22 +186,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>          .cast();
>          let raw_drm =3D NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOME=
M)?;
> =20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).=
data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given tha=
t `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) };
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_de=
v` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>          // SAFETY: The reference count is one, and now we take ownership=
 of that reference as a
>          // `drm::Device`.
>          // INVARIANT: We just created the device above, but have yet to =
call `drm_dev_register`.
> @@ -231,7 +217,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Please use a kernel atomic, i.e. kernel::sync::atomic::Atomic<bool>. See al=
so [1].

[1] https://lore.kernel.org/all/20251230093718.1852322-1-fujita.tomonori@gm=
ail.com/

> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,

Why not just Opaque<T::Data>?

> +
>      _ctx: PhantomData<C>,
>  }
