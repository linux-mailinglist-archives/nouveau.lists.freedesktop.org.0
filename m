Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6BA2E696
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 09:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B3310E4C3;
	Mon, 10 Feb 2025 08:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JeIBG7aH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C187310E4C3;
 Mon, 10 Feb 2025 08:39:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BB1D5C0748;
 Mon, 10 Feb 2025 08:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336CEC4CED1;
 Mon, 10 Feb 2025 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739176761;
 bh=cB2/4NoQX3HhCi0YEklI0a7Y6Qdh4paqmB9/dx2Qj5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JeIBG7aHXyacXb1ZdUsWf9t1KJyobLr4BCY3cBQFA+TkfxNWgbMHqf0/lMWghm6Ug
 WZ8cqCIltuIL+bxLhh9aRy0oTykCSyoXLxmMj5yeZJlE2REwtVUvRF9OToN6yNmNBW
 UV2XK9s95IUS0U1g785HzliMYnQEzUKsg/M3B4S56rp7zM02SR1fVQdFBVaaAreh8K
 1HrU4LITUBVqKKm59RVm1Gx0NlL2ABAj9BDUmKYWAEaRZ9Y2HHhAfqM20M/oI8Ht1k
 is5ihCsZRK+3Sb9VqZgHRvlN62Muie/Z26Jj579T9YmEUi3nlhdAe/HW/8V2wsfgVO
 CljokwOSXVVNw==
Date: Mon, 10 Feb 2025 09:39:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6m7MVErUPbkK9vV@pollux>
References: <20250209173048.17398-1-dakr@kernel.org>
 <2025021011-dangling-retrain-f61e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021011-dangling-retrain-f61e@gregkh>
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

On Mon, Feb 10, 2025 at 07:24:59AM +0100, Greg KH wrote:
> On Sun, Feb 09, 2025 at 06:30:24PM +0100, Danilo Krummrich wrote:
> > +config NOVA_CORE
> > +	tristate "Nova Core GPU driver"
> > +	depends on PCI
> > +	depends on RUST
> > +	depends on RUST_FW_LOADER_ABSTRACTIONS
> > +	default n
> 
> Tiny nit, if you happen to respin this, "default n" is always the
> default, so there's never a need to specify it.

At some point we'll want to change that to 'default m', and I thought keeping it
explicit is probably a good reminder. But I'm also fine removing it.

> 
> > +impl Firmware {
> > +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
> > +        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
> > +        chip_name.make_ascii_lowercase();
> > +
> > +        let request = |name_| {
> > +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
> 
> How does this match up with the MODULE_FIRMWARE() aliases that end up in
> a kernel module so that the tools know to add the firmware to the system
> in the proper place (i.e. initramfs or something like that)?
> 
> I always thought you needed to individually list the firmware files, or
> does the rust implementation now somehow handle that in a programatic
> way from strings like this?

That'd be nice, but the firmware we load is (or in general might be) only a
subset of the firmware that the module needs potentially.

So, you're right, all (potentially) required firmware files need to be listed in
the module!() macro's firmware field (or in this case within
module_pci_driver!()).

Back when I wrote this code we haven't had this field yet -- thanks for
reminding me of that.
