Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFED3AF8F
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 16:50:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B13F910E4B4;
	Mon, 19 Jan 2026 15:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Otq9VxZx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4508344CA1;
	Mon, 19 Jan 2026 15:41:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768837296;
 b=XxOgBR0BLQ6L/vvLzqKCRGQg3nacRIj/7nxV7xLkqPurw6yjqitPcmTseOP5vZVDY5onJ
 Muo56Qk4WKEXFnfcNHoaq6sF2tqISZ/uHSQ0EGraejQBk1SQIu7QG7izIhoZ4CNBpOvC9Pe
 USFoHtgWYLUhgFcd/M2spm8JkCxJ4Rw4G4xXhxg0ZsYZ6Hu8qoTvNYpcBST9RSmBIEkw1u8
 +KINGR1OANlqAQqujbn2qTXlraO2Lz8aXLwOEqz5b4ni4QLQd6ecrfnsxOwC/48c6LejWxf
 vQzr7z8zzCUX/R7lW4llG2+NGAHgjP/Vw/gNoUi0mWGpfxLAWbLzoCd+3fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768837296; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=W7rT9hHYL8T7lprygSHgm5zOCb0EvFYDb7jfwrRlIXY=;
 b=ka+cH4WaxHQYRZNyum/YKCLQwoDVHCclZhprwgsVkfd6NDakxyG7St0cRbOizxNFKwBnl
 2Z5GcbTbWienaei0HUF6TrYehfjU/1He7JrbN7mHV3SEsuOIm/Q9pIrF6I8JIEZhJ6gYLh1
 XVLO2Ub6t8qXVRzai5SDJ6aSPO3FBFmFR2ZOZP71ozM1RSA6ciw/CtvCXZ52Two7oV1XLG9
 lFx1GUHpbvvTlFa+KZVuFksoqIeWPM0VyE3BKX6HvSu06YDsc1Tau8i1XM4Ma5DUmKow/Kx
 S964uMPdYzjzaBAAkZ3y8KXDXJkKaFRx8wIHrIgPbeeeFMBbWpxzvBhr2s2Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 86A2644BDC
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 15:41:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCDE910E4AE;
	Mon, 19 Jan 2026 15:50:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D28042D65;
	Mon, 19 Jan 2026 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE4C19423;
	Mon, 19 Jan 2026 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768837815;
	bh=4bjc5aajcuzBHvXCPRPtvjsISc8dexTvQe1HeiR9z9k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Otq9VxZxTCDWO7NP/o5dZBtU+J9r7kwGjWWaBS5ZuQFvXYQW6QmPZYzv6lLEZSEh7
	 eIf8etXkH7aluEctAwBnFQfwWBGmNCS8EYcpQzSyDpaHdYfzFmM5MAa6rYQL1pr67F
	 vA23Z9df91ftloLSZ85httOC3PIqxdUsZT2T3ETaEd8GZkLQaSS/6hPMGn5teV0hjN
	 NE0tOqrwZK84qi+OCVdWaScwcK/9jHBVoGnvrpXbYxC0h9bKJzJbnzoRzhK6TLuTzt
	 /jPktw9xMgoQVbVtx6ada4eBunVBCMMj7TeBfjmxbDJPYBfT7e/wUDTdUk0aYLTWpG
	 MnDLlyeo5vHPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:50:10 +0100
Message-Id: <DFSOO86MMNW8.37S7T88EKPEFA@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 07/10] gpu: nova-core: firmware: fwsec: do not
 require bound device when unneeded
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
Message-ID-Hash: SFHLOQ4VPYIEM3IMGZG5LHW226Y75TMG
X-Message-ID-Hash: SFHLOQ4VPYIEM3IMGZG5LHW226Y75TMG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFHLOQ4VPYIEM3IMGZG5LHW226Y75TMG/>
Archived-At: 
 <https://lore.freedesktop.org/DFSOO86MMNW8.37S7T88EKPEFA@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 16, 2025 at 5:27 AM CET, Alexandre Courbot wrote:
>      /// Loads the FWSEC firmware into `falcon` and execute it.
> -    pub(crate) fn run(
> -        &self,
> -        dev: &Device<device::Bound>,
> -        falcon: &Falcon<Gsp>,
> -        bar: &Bar0,

Hm..the method also takes a &pci::Bar, so its either called from a bound co=
ntext
or within a Revocable critical section.

Leaving the other argument as &Device<Bound> makes it obvious which one it =
is
(and should be).

> -    ) -> Result<()> {
> +    pub(crate) fn run(&self, dev: &Device, falcon: &Falcon<Gsp>, bar: &B=
ar0) -> Result<()> {
>          // Reset falcon, load the firmware, and run it.
>          falcon
>              .reset(bar)
>
> --=20
> 2.52.0

