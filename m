Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8CCBA8EB
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AAD10E416;
	Sat, 13 Dec 2025 12:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="KjPJFeS0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Tue, 25 Nov 2025 07:49:15 UTC
Received: from outbound.pv.icloud.com
 (p-west1-cluster5-host11-snip4-10.eps.apple.com [57.103.66.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C0110E108
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 07:49:15 +0000 (UTC)
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-1a-20-percent-2 (Postfix) with ESMTPS id
 344091800102; Tue, 25 Nov 2025 07:42:09 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=u4e/PfZ0WZtkbNYIgZhHCSb30ylSjvq0fvJRAjJUeqs=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
 b=KjPJFeS0gTfy2hKb98gJKEjQK5zaPjyNX51WUG8QSqYW9Uwc6XPfKfi7sH6lM8GrEyi5leyWrB+SJVFkx8eRxngDMiP6kT2WxTA08QAn65PneTWgQgsCaJDN+6kUYOQmHZJ36FuI4/3sJH9OHgy7sZ8NYNlHyJZFBt0zJH1UXluQdo03Vu8UIT84H5GqXhyM6my/ueFMGBlF1c8Sl1YuoUI/iOsdgNMK10oSpoF5jmzKRBNZnwzIvr+heGv8xfglfI1NnEU6l8fD0hfbvQLd/oHPdd5oxC2uGPCHaCRBCJw5J37jMm45dFjbpgFaajWG05dkGXVe+Vqm8+wLZsZX7Q==
mail-alias-created-date: 1746336505199
Received: from smtpclient.apple (unknown [17.56.9.36])
 by p00-icloudmta-asmtp-us-west-1a-20-percent-2 (Postfix) with ESMTPSA id
 919721800160; Tue, 25 Nov 2025 07:42:06 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
From: bshephar@bne-home.net
In-Reply-To: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Date: Tue, 25 Nov 2025 17:41:53 +1000
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 brendan.shephard@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <29983389-7D74-4BA4-87A4-C42A8E433957@bne-home.net>
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
To: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com,
 jhubbard@nvidia.com, airlied@gmail.com
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Authority-Info: v=2.4 cv=YfewJgRf c=1 sm=1 tr=0 ts=69255dd1 cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=LfVoDZclgERIsXc5TQwA:9 a=QEXdDO2ut3YA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2MyBTYWx0ZWRfX7DbQkYX5bt1b
 0AjAokFAbzXJ18vqjDWJkrP/IJ/w+B+bZZCGHDJDCW9fvAzEz9h7ibqdLeioHswDu2N+fk7Z5a3
 DgLdJKtps5YW1r/0u1DIaMZXOpNLfTQ4D0elaOjR/SAEt8RdB0/Xc+I+AaK2A4gfPs2nHwrV9wC
 wlc8K+vyFl+OrRjnhP8EfXh4k3xmp8v73e1vTbZumRc+4VVB2lOErBSQVnWxUeHj8ZYHz2T0pEz
 16fO9c666zpEwKPidZwiG4/s59efVyUqpPdCk5pSag7e8QqYADpXVozyfvOLBapW53zFjFGsLqc
 Zk3nNNUStZ7qh3Hv4IW
X-Proofpoint-GUID: fhfd3o-vMZCQRrBt_pdm0dnx59urNVCE
X-Proofpoint-ORIG-GUID: fhfd3o-vMZCQRrBt_pdm0dnx59urNVCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0
 clxscore=1030 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250063
X-JNJ: AAAAAAABmanG5DlIGI6oUKm5uYYZHXfknaeJWfR93N77TfxG2vAv4nrr31ItIkQtbhtTDjazv9CZcByTPUqhzGIfUIpvWwgwmjIFXOgvH/v6Zh9PYYotOoXCThZGZXtPlWVVsy4TrdWW/NpOC+k6q1AleS9ec8whCqztD+TRf6M6TYqlOc3AcWBpCAW53tqGM2dShEOgdWNo3Tm7vQLBaxHW8UsG45DDTJ/I+ulpg2NyHycY4TKNo+xgG0g6yQVeSDgCe/lDj4xX03zcRSUDMM4gOuhuihhL6Zw41rrDAyLmT3gXUn90ic6XR6onN0N7ozARRJZW6W7INFG5jmGYOTnCb9X+bjJE936U9FWqaYrRglygLh7ChXDgWLEtxvb6TpYGTfKHVnA2ZrLkAituUdGCsmZK8LbB4au76IxeD1nZ3UQiItK56wpMYNuAUrHdDs79uC69EHmLMHFpQ8cfEW0u2ZNYI9APaFAaLZQD3aXy0UTnkhy69Nid8ldq35TNA7/UHQD51hXL58WNA3q7BRJIFvMLIlr/bgWtbo0pzSNZyLQlGhcouJc+Wi3hY0s6P/Fq146QO/Kj00jvgW0waPhg5zWqElwhqBBuA0I7hoEqd1pgBVsBiVpbf3V2qVbn73NUDQ7eAWp6itrD3upHqWXLSZsqPLdIVrlPL268ua/AGUQcQ8S0HVC27VKI0SB1MIAgi3LuEF53S8x8HwsquA==
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:03 +0000
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

Should also note that it=E2=80=99s currently possible to overflow =
usize::MAX here which causes a panic. This patch is also addressing
that by moving the overflow check to before the page alignment. If a =
request from user-space is made for a size that is
Within one PAGE_SIZE of usize::MAX, then it will panic when we try to =
use size.next_multiple_of().

So even if we want to keep the 4k page alignments regardless of the =
underlying CPU architecture, we should at least do the
Overflow check, and use page_align() instead of next_multiple_of().

> On 21 Nov 2025, at 2:04=E2=80=AFpm, bshephar@bne-home.net wrote:
>=20
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This ensures that the allocation is page
> aligned with the system in cases where 4096 is not the default.
> For example on 16k or 64k aarch64 systems this allocation should be
> aligned accordingly.
>=20
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
> drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..a07e922e25ef 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,10 @@
> use kernel::{
>     drm,
>     drm::{gem, gem::BaseObject},
> +    page::{
> +        page_align,
> +        PAGE_SIZE, //
> +    },
>     prelude::*,
>     sync::aref::ARef,
> };
> @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl =
PinInit<Self, Error> {
> impl NovaObject {
>     /// Create a new DRM GEM object.
>     pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self>>> {
> -        let aligned_size =3D size.next_multiple_of(1 << 12);
> -
> -        if size =3D=3D 0 || size > aligned_size {
> +        // Check for 0 size or potential usize overflow before =
calling page_align
> +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>             return Err(EINVAL);
>         }
>=20
> +        let aligned_size =3D page_align(size);
> +
>         gem::Object::new(dev, aligned_size)
>     }
>=20
> --

