Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C0CCC5B1
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8912A10EA39;
	Thu, 18 Dec 2025 14:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y/THVjnM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9E16C45627;
	Thu, 18 Dec 2025 14:48:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069296;
 b=qzYfi7JqFrlqRyIqm55diN7RjketbpyfjMwXituu36i6+1ng08O3wTik67gT+QJMCzSCH
 txs5i3x4CPUDswIzYNAom4193aQAGhQ1GEhx2zi049vC1mejPBcj9FH52rwQkgRSgXWjIp2
 jAAjwbP6ouT7cU5NT0wEpGyBaHC9xsDzGPSy23BjPF9Zl72z0OMpyMtsdqy+FUWuZGRGe6w
 UkP9mGiWevLVhyFWWlhkZUTxhUlyq1W+T1/wUf+cqPhlVsf8E2pzrugFcTzkzC4DYfeG1AP
 qpDn4cVIoIUZXCapo3nwT/CmWMCL7f9Skf4fOFOC00KEJZ47rVluu2trEKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069296; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xfZOi1vmhtXMCOEPZBKzPiDA4Vj87I28C4MuvUCCDv4=;
 b=xf1yVJMt89UKFxxj5ZhM/Oj0sgaZOWcpNokEk+v1gHSqwkvfcWY9LU339+ML3P6np/8MB
 ZTbEUGD5rUnCxJNCtvHo3D0ftJtDM2fO/D3t+mQCl8iaZZ+PFHmgjdGDEVwcCs5XSbah0+K
 5LWkG7p7OXyD/dLU7/igDHKSQezMEq+olFXuLIAsj+vUoHh79QQy6CddeEKWg3D3A0i4cWA
 PaD5rFLfNWZUnM2SfWIU/8aiwbHDtBWFPxxIkO8XiOGmMHRvjCA/dHDLUhrLH0Ez/O6N5NW
 7qjiSoqPzqK0T0Rrl1IUk5kbcceUxVfTwnnOYynzI+LPgyGdaaGx4DZdYegA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0C4E345687
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:11:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09310E3A4
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:18:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1B9A40BB4;
	Thu, 18 Dec 2025 10:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56396C4CEFB;
	Thu, 18 Dec 2025 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766053111;
	bh=I/6kvKM9p8XY3+0CKtKDEdvBP+NxnC4Rq9qspP9kerk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Y/THVjnM1abEaJR+U1aTdEdX6K+6AeFV/du+Aq+CHT8c4CoEXDkcm9Cf+PPuz3rJ9
	 5B9eL9CTda38tTo++OYWq1sW1R3wemxZgUw/WqAsats/psF7yQx8F85pxfo8pXLyJ6
	 WLvCsdMVHluBfiiFMpOhk2X9jh96oBfWYU+xw8v/cxesibp7OEOAc1Ssdo5WcdTte2
	 keTw0LWLTIQMt6Sqes/2SirtQyuT6tyMuQKkwz7PjFO/sxx/9mNneI5xH87FBBivUy
	 a+g2rLs4k45DiTXqcSQLMBbs4b6tMDicQCcP0/W6EX8ZjrXlQSFFE4M4tuikdro2H8
	 yiGHFbJU4m/Wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:18:28 +0100
Message-Id: <DF19KTQTKOS9.33N1KT9WNLAUO@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 7/9] gpu: nova-core: implement BinaryWriter for
 LogBuffer
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-8-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-8-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZC465HFREFFLKLBJ75URF6TZAYL2RHF2
X-Message-ID-Hash: ZC465HFREFFLKLBJ75URF6TZAYL2RHF2
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZC465HFREFFLKLBJ75URF6TZAYL2RHF2/>
Archived-At: 
 <https://lore.freedesktop.org/DF19KTQTKOS9.33N1KT9WNLAUO@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index fb6f74797178..860674dac31e 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,29 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut kernel::uaccess::UserSliceWriter,
> +        offset: &mut kernel::fs::file::Offset,
> +    ) -> Result<usize> {
> +        // SAFETY: This is a debug log buffer. GSP may write concurrentl=
y, so the
> +        // snapshot may contain partially-written entries. This is accep=
table for
> +        // debugging purposes - users should be aware logs may be slight=
ly garbled
> +        // if read while GSP is actively logging.
> +        let slice =3D unsafe { self.0.as_slice(0, self.0.count()) }?;

Unfortunately, it's still undefined behavior to create a slice when the bac=
king
buffer can change unexpectedly.

You can use UserSliceWriter::write() instead or add an unsafe method to
UserSliceWriter that takes a raw pointer, length and offset.

Given the context of a debug log buffer, I suggest the former.

> +        writer.write_slice_file(slice, offset)
> +    }
> +}
> +
> +// SAFETY: `LogBuffer` only provides shared access to the underlying `Co=
herentAllocation`.
> +// GSP may write to the buffer concurrently regardless of CPU access, so=
 concurrent reads
> +// from multiple CPU threads do not introduce any additional races beyon=
d what already
> +// exists with the device. Reads may observe partially-written log entri=
es, which is
> +// acceptable for debug logging purposes.
> +unsafe impl Sync for LogBuffer {}
> +
>  impl Gsp {
>      // Creates an in-place initializer for a `Gsp` manager for `pdev`.
>      pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl =
PinInit<Self, Error>> {
> --=20
> 2.52.0

