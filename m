Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC176B4D
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2019 16:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BBF6ED85;
	Fri, 26 Jul 2019 14:17:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAC36ED85
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2019 14:17:16 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6C48218D3;
 Fri, 26 Jul 2019 14:17:15 +0000 (UTC)
Date: Fri, 26 Jul 2019 14:17:14 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20190725194005.16572-3-lyude@redhat.com>
References: <20190725194005.16572-3-lyude@redhat.com>
Message-Id: <20190726141715.A6C48218D3@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564150635;
 bh=mYb9tnyMydsoXx8opNpjgA2uNSERf24lU2vtCx3iHb0=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=LCOEzWgPegbr3KdsK3jIM150NTS+TL1nvGjFhLpQeG7JkoH5E8w3rdOSRhOvWra3A
 M3yS6/Ro5u/HSrIPkW7oYlyBXCQLxQksUGfh5HAN2uRMTXdUawdYhtYNgviExDI6vg
 4K7oHKTc6NtQ1JufiHc7sifiIqjFZxgLzfPLN7nU=
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau: Don't retry infinitely when
 receiving no data on i2c over AUX
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: , Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhIC1zdGFibGUgdGFnLgpUaGUgc3RhYmxlIHRh
ZyBpbmRpY2F0ZXMgdGhhdCBpdCdzIHJlbGV2YW50IGZvciB0aGUgZm9sbG93aW5nIHRyZWVzOiBh
bGwKClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2NS4yLjIsIHY1LjEu
MTksIHY0LjE5LjYwLCB2NC4xNC4xMzQsIHY0LjkuMTg2LCB2NC40LjE4Ni4KCnY1LjIuMjogQnVp
bGQgT0shCnY1LjEuMTk6IEJ1aWxkIE9LIQp2NC4xOS42MDogQnVpbGQgT0shCnY0LjE0LjEzNDog
QnVpbGQgT0shCnY0LjkuMTg2OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2ll
czoKICAgIDFhZjVjNDEwY2MwYyAoImRybS9ub3V2ZWF1L2kyYzogbW9kaWZ5IGF1eCBpbnRlcmZh
Y2UgdG8gcmV0dXJuIGxlbmd0aCBhY3R1YWxseSB0cmFuc2ZlcnJlZCIpCgp2NC40LjE4NjogRmFp
bGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBkZXBlbmRlbmNpZXM6CiAgICAxYWY1YzQxMGNjMGMgKCJk
cm0vbm91dmVhdS9pMmM6IG1vZGlmeSBhdXggaW50ZXJmYWNlIHRvIHJldHVybiBsZW5ndGggYWN0
dWFsbHkgdHJhbnNmZXJyZWQiKQogICAgMmVkOTVhNGM2NWEzICgiZHJtL25vdXZlYXU6IHJlY29n
bmlzZSBHTTIwMCBjaGlwc2V0IikKICAgIDc1NjhiMTA2NzE4MSAoImRybS9ub3V2ZWF1L252aWY6
IHNwbGl0IG91dCBkaXNwbGF5IGludGVyZmFjZSBkZWZpbml0aW9ucyIpCiAgICA3ZDI4MTNjNDM3
YTAgKCJkcm0vbm91dmVhdS9sdGMvZ20yMDQ6IHNwbGl0IGltcGxlbWVudGF0aW9uIGZyb20gZ20x
MDciKQogICAgZGIxZWI1Mjg0NjJmICgiZHJtL25vdXZlYXU6IHMvZ20yMDQvZ20yMDAvIGluIGEg
bnVtYmVyIG9mIHBsYWNlcyIpCiAgICBlM2QyNmQwODYwOTIgKCJkcm0vbm91dmVhdS9pYnVzL2dt
MjA0OiBzcGxpdCBpbXBsZW1lbnRhdGlvbiBmcm9tIGdrMTA0IikKCgpOT1RFOiBUaGUgcGF0Y2gg
d2lsbCBub3QgYmUgcXVldWVkIHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBpdCBpcyB1cHN0cmVhbS4K
CkhvdyBzaG91bGQgd2UgcHJvY2VlZCB3aXRoIHRoaXMgcGF0Y2g/CgotLQpUaGFua3MsClNhc2hh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
