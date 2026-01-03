Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7FCEFDB6
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 10:52:44 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D197B10E325;
	Sat,  3 Jan 2026 09:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxlcrifn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9416C44C85;
	Sat,  3 Jan 2026 09:44:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767433475;
 b=nIqjODabb8i5f21m+jvp8w0MLKLDUuKxeMeCOUZ6xqhjCVfvCbHnfUs/c1GUjQ4nNHpCN
 M5ffyIT45T4xfXFFqFBUL59Afm/rLuKj5VyBsWvAkHdEKHqB2P2isk2k+PTQYDpZ6zrMns4
 68gMUFhm8KxXoPsVK5BIOy5Ws9JIahW+X1MasV+9BuOpJLfy/5MZYizxlXvRr3T0iZMtiAT
 w5oPqaGV0zV8fBuEuuh6/purwgOrdVwc8T6F8l6mArP8SdTdsdmv8l9ekGLW80Uv8KDIhj9
 QjkwDFPTDpWecxyrnrLk/1JUvI/BHehrqcKJ3TS3/8Dj9NsqUO+4AATu+WeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767433475; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fIdvOLVbwUzxXMnavJ2/2BSEbza9Fb1QGaiYvxnoMXE=;
 b=mcwgxnLWFUd3Jg5AzdUBJFUZhi7W+tDJvuh+YCsDcrWDI8ye/MNtuydC2EYyZ2KarRnud
 Qb4jYwbgXIjHcta3F6XGS0Ipvm1C1zXSCAhA8Rm3WTh6uf7XydFW9J+cEMKxfw6CCd+tzG+
 gVAyMSdK3tdpbFrUC0ZyvWuiCQzMTCjsQKZ97FwyF6u7aepX4IWEH/GfV2I54w3FH06b1pT
 lfTL/8nc4YqgvyGDrVlQEEKJM95bygl+fsokJVkPBGcqaxKZnNlKTlYPqMx7gX3DH3WCD7/
 qifzVCl6h7/5oGRS7QSp8eSlnj9D0/2U9Ir8LDV+1tKvOXaaLxS+q7wQM3tg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 00D9844141
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 09:44:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6D10E00D;
	Sat,  3 Jan 2026 09:52:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75CE76014D;
	Sat,  3 Jan 2026 09:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F5FC113D0;
	Sat,  3 Jan 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767433957;
	bh=Z73Af2+RRxrUg3W9C+jBUFDIPjZKIyc/ygvMlU1xwmw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=KxlcrifnRdFRe2vVpgBAT8VXFHpGPqfol64UrKSuIPiubQnhw0WnKkZ1qp2GhwWza
	 Fa9OnJUMeSMgfQVagtA6lddv8xQBCZMcISMFdZc3gZRLRwdv6kZeS78xH+nNTx02ow
	 i+LSUMtDDFWYfPCwB6SA5TUeCZ7NgWjwo77yomppZIDXcTRAXG/cTiLL6Sm0yiyoy6
	 5qrNoWFE8Dy7X/xUdA/E+B2Xf1l0fntwXQ3y5kbgHBW6c/ivVVGCb0Q0hzqizv6SXn
	 U4NDc2SB9PVp1nEn7ZcfLRC7/0h2ix1xtvPEiUaEFo9S+h+SbhN40BkwCPhHCqHXIK
	 DWCjf4QEl7lSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 10:52:33 +0100
Message-Id: <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use stable name() method in Chipset
 Display impl
To: "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260101184137.80445-1-mhi@mailbox.org>
In-Reply-To: <20260101184137.80445-1-mhi@mailbox.org>
Message-ID-Hash: DEBVGEIWVXLWDS7PAJRXPJGEG7UM3EIU
X-Message-ID-Hash: DEBVGEIWVXLWDS7PAJRXPJGEG7UM3EIU
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DEBVGEIWVXLWDS7PAJRXPJGEG7UM3EIU/>
Archived-At: 
 <https://lore.freedesktop.org/DFEV1P747QKG.3O75MCC6HFYK4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 1, 2026 at 7:41 PM CET, Maurice Hieronymus wrote:
> Chipset's Display was using Debug formatting ("{self:?}"), which is not
> guaranteed to be stable. Use the existing name() method instead, which
> provides stable lowercase strings suitable for firmware path generation.
>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  drivers/gpu/nova-core/gpu.rs | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 629c9d2dc994..be8c882338ea 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
>      }
>  }
> =20
> -// TODO
> -//
> -// The resulting strings are used to generate firmware paths, hence the
> -// generated strings have to be stable.
> -//
> -// Hence, replace with something like strum_macros derive(Display).
> -//
> -// For now, redirect to fmt::Debug for convenience.
>  impl fmt::Display for Chipset {
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        write!(f, "{self:?}")
> +        write!(f, "{}", self.name())
>      }
>  }

This also converts the printed string to lowercase. While this is not that =
big a
deal, the solution we are looking for instead is what the TODO comment says=
: be
able to derive a Display implementation (for enums).

Now that we have syn in the kernel, this seems quite straight forward to
implement. Are you interested in working on this instead?

Thanks,
Danilo
