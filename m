Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C90DCCC5A7
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4030810EA17;
	Thu, 18 Dec 2025 14:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LsAh0o1b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 457E645644;
	Thu, 18 Dec 2025 14:48:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069294;
 b=P8kW+Aqj8MMUQex3VXPGkaXa/nvMRBxBQ3TvN+nMIRoFgpGuAsUhT/0DmXATFusA9w9TY
 mhw4s7ZR+sLFJ9a4irPbxU0EtclL40/sUqsVtpUjCR8oE6KwHD1suewd1qPkIYxvHeY/VMu
 Nxgu/okeb43fVSvEk3IbVd5WKnMHsl1rYEaK+8GkTZof0KPWp1MkRIP0qASw0vFz/pwp4Ob
 gFKGAgkOOKYeUdJwzu7N0dyBnYKW19NcDFjyvTHcqi9guoliAYK7PVP51PVQAHpP3SicXA2
 raveFl4htO/sHnnaPMnJz0jcwkFjk1yHI+Bow11neO5HNi0z597HZwZWMEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069294; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XTdeLCVMVhX9yP/xX1vEiC6uxv5aW5Fw5iZz5rPvMmg=;
 b=NqcqXINYA1GTXzCflGFefi9m2ToMA3eyVDjifMPG59heBkFs6PI1C4l73TAIDJN3Jpwgr
 6q1VzRqvQ2xfKaCsN1U1Ec5zTdkhWuWDkJ7JwT4lepHPXzOyAdh5ghv25Jnzk//Rgznx4BI
 4PP1BBFPWP7vd5X8IUacBGTFz8muwPBtMsHSpvqnXqFqjG7sbndMgPlcP6joyYrbxDJdmuL
 nPFV+wwN0I+vyCncBrlsasBp2DpkI0VGWsEbnJOMJiNSJifj5m/QJVy5RU+DDbXTe2awDoZ
 2qBOnVrr2BzGO9YF3oXoetmQGfc+HHJlTM5I21DKymaEdYF1GU3ZV4OGP83Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E4D34567C
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:48:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 61BF410E271
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:55:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1019643E35;
	Thu, 18 Dec 2025 08:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03058C4CEFB;
	Thu, 18 Dec 2025 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766048137;
	bh=APgZFUJ+vBo7lg8PesH/7B10j9ZTgBKzRnI9GYl+hx4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=LsAh0o1b17VDFNIJCmsvw8lYVKnieaD/Jjnud3cAi5rA84NjUJm1mhdedfoNwXs3a
	 zrSnsgDgmpDu8gopwiTPaxDWynXM9udXjPvOkYl+bK9NpMS5sEzA10Z42voq1UzN9T
	 Ux1VqcPydya11y6U9kT6MZisVDH9Vv/OxS/oPEZSm00RmvhAPmOgiKMO6V+Wd9n5zA
	 qADQmTDlwf4bPOyYvEqLBI2On+nYZ3i2y4NsWZFpLz9zqejqvNlZgwp0oL0CYOQudv
	 OSIYze5O53LOpZsua2hPixiS6+oO89WOU9ccVQdEse6wIfUJZX8+VlAPS83jWcY71+
	 BTMViIVsdVTmQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 09:55:34 +0100
Message-Id: <DF17TCJPO9RT.2BK28ZOQSF9SN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-2-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ILDG7HRTF7FQDFZVFHS3WH57KAZDDHTL
X-Message-ID-Hash: ILDG7HRTF7FQDFZVFHS3WH57KAZDDHTL
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ILDG7HRTF7FQDFZVFHS3WH57KAZDDHTL/>
Archived-At: 
 <https://lore.freedesktop.org/DF17TCJPO9RT.2BK28ZOQSF9SN@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> +    #[inline]
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw` is always a valid=
 pointer to a
> +        // `struct pci_dev`, which contains a `struct device dev` member=
.
> +        unsafe {
> +            let pci_dev =3D self.as_raw();
> +            let dev =3D &raw const (*pci_dev).dev;
> +
> +            // If init_name is set, use it; otherwise use the kobject na=
me
> +            let init_name =3D (*dev).init_name;
> +            let name_ptr =3D if !init_name.is_null() {
> +                init_name
> +            } else {
> +                (*dev).kobj.name
> +            };
> +
> +            CStr::from_char_ptr(name_ptr)
> +        }
> +    }
>  }

This does not belong into pci::Device, but device::Device.

Also, please do not open-code the init_name dance, please use dev_name() in=
stead.
