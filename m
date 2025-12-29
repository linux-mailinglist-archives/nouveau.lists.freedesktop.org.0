Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265ABCE7B74
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 18:14:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 04CEA10E5D4;
	Mon, 29 Dec 2025 17:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SplWRb82";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3D37C44BAE;
	Mon, 29 Dec 2025 17:06:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767028011;
 b=wJx+S2++HDVnUphn6/2+lONYGgPXa72DJUZwp7wdlQQiT5OMy4RG+1CfOLrD1lD8CA7dL
 fpQ6SZjc9kCo/DSavYWRDkyezctQwuJKKrKNDZ3wCe1R/KxKRCciqsQoiPGBASyaEYfrbXq
 EfAexCen20cj5GCeOmyBKz6ybgNOjDGrliZGXv14Gynt4m5OZBpFtx8WH/6SKI1qHaFRJhE
 1RcVA3TjmQ1DHDcupkSRDmDSonnmIg6KcMUu5dN6thAjzEfPmuU+IG0bkF8lIKWkleDnmOW
 5K9JTELgtOxcuhTAgNU4fSiaRlImtYS7RVteHK0K5jf/AD79/d9yelHYThnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767028011; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=70pMF0tZvi759bz+6lPYglJc2rW36kpCOk/59CwJpzE=;
 b=HtUBEkfG8eoqm4g0/Z0qQTkpy9TV9V+NFeeto58csBDXFWOCn1fAmesXFV9Szcyi/CQq/
 84aesu4wg7LFwa895kjCg3FyiFocWK1GkzOKa5riMcuoEN7j6AWLU0js6Kr/22f/Ki9q7l9
 0KNTUUEmsDhbg4u18DiiX2j7LOD0JtjbeXO2gHPqdC0SmewgU5cLeBvsYxNQOqwjUb/Q3D2
 Aj1jVkETBDg+AHvYlW88MR+U1AQW3U0CJZlFWC0yGa8m7VtopnXJUkFenEIRkhCjoIwa1yp
 k3q2XtYLjMo2g/0oRMvOEP6/h0tfNLmuho9L3lvB19TxonSQG0pK4qW/553A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A01C4401E
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 17:06:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D22510E5C6;
	Mon, 29 Dec 2025 17:14:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 875306000A;
	Mon, 29 Dec 2025 17:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D5C116C6;
	Mon, 29 Dec 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767028482;
	bh=70pMF0tZvi759bz+6lPYglJc2rW36kpCOk/59CwJpzE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SplWRb82hNcFOrWMWTkdGeqI1hoUIZbek6s4kRvBOl75NqFm2HtADcsYTff4BjKWD
	 /7ChNZYAOnPb9a36NlMIF4ZHC4Q1VS5M7LlZntPkd8dbe2aEUSO42M/XQsvCqY+Vvw
	 jtF5RODOztaj2o7otoPFuLjO70XXiNpLXnS0V7YLqHY0eY/27tBz3XbhHNaGUg/MkZ
	 N6BHT59Pry/m3mVphPuoWgznr9OL4vd1LxggREQuXJCocYMlp+x1l3WASR9Fc2xh3u
	 w8X5orI1RKqnDHIRHRP6h1cigZM/b03Z1uSjuLaGxkhzmr8kIlP0hMXCkZToBb6DJC
	 qnqrDm/JHoG2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 18:14:38 +0100
Message-Id: <DFAVBGKJA41I.2UAE74BOHKUSS@kernel.org>
Subject: Re: [PATCH 0/4] nova-core Improve pin initializer code
To: <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <apopple@nvidia.com>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
Message-ID-Hash: PRCEEBQWJ5KK22HL35R6UK5IR4DN5ZMU
X-Message-ID-Hash: PRCEEBQWJ5KK22HL35R6UK5IR4DN5ZMU
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PRCEEBQWJ5KK22HL35R6UK5IR4DN5ZMU/>
Archived-At: 
 <https://lore.freedesktop.org/DFAVBGKJA41I.2UAE74BOHKUSS@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 4:50 PM CET, Danilo Krummrich wrote:
> This is a minor series to improve some of the pin initializer code to:
>
> 1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
> values with pin_init_scope().
>
> 2. Relocate code that technically fits in the pin initializer into the
> initializer itself.

Applied to drm-rust-next, thanks!
