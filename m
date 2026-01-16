Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65111D38644
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 20:56:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5898B10E921;
	Fri, 16 Jan 2026 19:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VM3LxnqI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3D3E344C96;
	Fri, 16 Jan 2026 19:47:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768592847;
 b=yL/pIiR0j4iVbkiS0wpCPYDyrbtQfwXMqiwTXGyNuWCcvswb82gLUsgnl9cos/2EXtOZH
 FqpfX3kUzuo93RmZViRNzOQr1spVC91k4srlkHqoyr7WPTqs4SHzmLSyY9ALF/v8mvxtQtH
 xamxaqBSF74jzLhkYjTGiRB4rkfMzOH91MXaacUCfJKzhpBVCdxO4a5RGshoupFQhgRqyJt
 9Qf8vk3rFiAc9pytLPVk4BdrOP01JM64YA1xnUsWZ3m2VS1XbV1/ZaDL9Z2Cy4lU4SmHmmV
 SWOrpzAb64E6AB8H5NFQCNV2vnHqdCmXUw+JhmEQQcG31dzzHTQ/c0LCszpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768592847; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YKnGkJQbd5QdCIj6TrpW396ZEecYopB12FmXeu7nmFE=;
 b=gW44DUwEpvlmvd2R08aIVI8xgGANCxsTN5yKaacCo+et3hKGkohz7JTXveVVM/mH5a6fO
 17LijymsJUPNQTq/3pIAXyscHJMw9E6x35LsKlP0VcR4jzcLCJw1qRd9SFdNKNpd/FSYpKX
 oomyttJw800aRCDw98W1q5jkGdB6dMgkeMscnAG8vJ8eriwfVBATSy7y35W6+fgRpkvJFvM
 OhGfrJTavAl2cp7v2bTCQMK5r8Es4nbvLFbdhUl143m+zFEsrGUNOqKcppH3lLi6fJrLNgf
 l8iLJCYiL1JK27p/qHifE4e+QoEf+Kws2W7ld6rrOL1A+cTg9NSETn0KwyvA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E5D344B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 19:47:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0215110E1D4
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 19:56:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B988E40BCD;
	Fri, 16 Jan 2026 19:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0C4C116C6;
	Fri, 16 Jan 2026 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768593360;
	bh=EqZPA+4yIq6PIe3DOFL/YCoQzgqQgLA/B0VF5a/R/wU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=VM3LxnqIlffwTfHa1HBLQUg8TBCLoc579sDMtwgtt2LoeKfcafUACEJCpxJbQ23j5
	 yh71F5Mb86HQwk7SAfdepJxwy2iWblOHxIqAjBbUUzAwUdtXsUth2swb0tNef2KR4i
	 m4Am9bgJXu3us/L1Km/VOCKSqhyAp5ZpLYlz0vabEG7WM9He/awIsZyLH0Y+XHgWsf
	 JoL1xoiqe5RnzVOQ0/4U+GoxEvxIaLX5i3ZfF5Q8RmyP8theubsg26Of3XS6jqdFiX
	 u/yD61hD7xNCiKbIDCzqM4LdfZOKvBPVCqOBNzF5VrUHJbcHffYC7YcVGiYDpQTSh4
	 XG2+Jf5LPMZ5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 20:55:57 +0100
Message-Id: <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-7-ttabi@nvidia.com>
Message-ID-Hash: PX5UZ5TZX6NA2WTZZCC3VVDXB2IRQWH2
X-Message-ID-Hash: PX5UZ5TZX6NA2WTZZCC3VVDXB2IRQWH2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PX5UZ5TZX6NA2WTZZCC3VVDXB2IRQWH2/>
Archived-At: 
 <https://lore.freedesktop.org/DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 8:29 PM CET, Timur Tabi wrote:
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(true));
> +
> +        // TIMEOUT: falcon engine should not take more than 10us to rese=
t.
> +        fsleep(Delta::from_micros(10));
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(false));

This code is just moved, but repeated in the subsequent patch adding the Tu=
ring
HAL.

If we always expect the falcon engine to reset within 10us regardless of th=
e GPU
architecture, we could add a regs::NV_PFALCON_FALCON_ENGINE::reset() functi=
on
doing the above.

If it the exact timeout differs, we could just pass it as argument to
regs::NV_PFALCON_FALCON_ENGINE::reset().
