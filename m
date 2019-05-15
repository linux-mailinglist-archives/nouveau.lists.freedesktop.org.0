Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C41F452
	for <lists+nouveau@lfdr.de>; Wed, 15 May 2019 14:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892DB892FD;
	Wed, 15 May 2019 12:26:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1C6892FD;
 Wed, 15 May 2019 12:26:46 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id AF6156086B; Wed, 15 May 2019 12:26:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.79.15]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DF336072E;
 Wed, 15 May 2019 12:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DF336072E
To: Colin King <colin.king@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20190514205701.5750-1-colin.king@canonical.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <c214275e-912b-9cec-d0c1-4eadd07a100e@codeaurora.org>
Date: Wed, 15 May 2019 17:56:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514205701.5750-1-colin.king@canonical.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557923206;
 bh=Jq8r59j8L9cuyE+iEkCCfN3oZ7FkZj2PtazceDgQIjs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MoPgbp/Xauv8laEhwNTlkhgZ2bVtQ1U1SDf8IfsQqY4VSnd2bSnTWIriAbPiMcu76
 Ycm+5nIoOdpmSiqxx4RE6/feZYh8xgI++0BVVMCFl5oLbuHKYkyMwCFXbNkPxVokLa
 pYJpINMcVfPd1N/SbBZv3QTsV0W3Efs1ckc6aIQ0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557923206;
 bh=Jq8r59j8L9cuyE+iEkCCfN3oZ7FkZj2PtazceDgQIjs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MoPgbp/Xauv8laEhwNTlkhgZ2bVtQ1U1SDf8IfsQqY4VSnd2bSnTWIriAbPiMcu76
 Ycm+5nIoOdpmSiqxx4RE6/feZYh8xgI++0BVVMCFl5oLbuHKYkyMwCFXbNkPxVokLa
 pYJpINMcVfPd1N/SbBZv3QTsV0W3Efs1ckc6aIQ0=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios/init: fix spelling mistake
 "CONDITON" -> "CONDITION"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDUvMTUvMjAxOSAyOjI3IEFNLCBDb2xpbiBLaW5nIHdyb3RlOgo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBUaGVyZSBpcyBhIHNwZWxsaW5n
IG1pc3Rha2UgaW4gYSB3YXJuaW5nIG1lc3NhZ2UuIEZpeCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+ClJldmlld2VkLWJ5OiBN
dWtlc2ggT2poYSA8bW9qaGFAY29kZWF1cm9yYS5vcmc+CgpDaGVlcnMsCi1NdWtlc2gKCj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5p
dC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMKPiBp
bmRleCBlYzBlOWY3MjI0YjUuLjNmNGYyN2QxOTFhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jCj4gQEAgLTgzNCw3ICs4MzQsNyBA
QCBpbml0X2dlbmVyaWNfY29uZGl0aW9uKHN0cnVjdCBudmJpb3NfaW5pdCAqaW5pdCkKPiAgIAkJ
aW5pdF9leGVjX3NldChpbml0LCBmYWxzZSk7Cj4gICAJCWJyZWFrOwo+ICAgCWRlZmF1bHQ6Cj4g
LQkJd2FybigiSU5JVF9HRU5FUklDX0NPTkRJVE9OOiB1bmtub3duIDB4JTAyeFxuIiwgY29uZCk7
Cj4gKwkJd2FybigiSU5JVF9HRU5FUklDX0NPTkRJVElPTjogdW5rbm93biAweCUwMnhcbiIsIGNv
bmQpOwo+ICAgCQlpbml0LT5vZmZzZXQgKz0gc2l6ZTsKPiAgIAkJYnJlYWs7Cj4gICAJfQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
