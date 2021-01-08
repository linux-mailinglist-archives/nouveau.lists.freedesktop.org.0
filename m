Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4332EF9F1
	for <lists+nouveau@lfdr.de>; Fri,  8 Jan 2021 22:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9738E6E8D0;
	Fri,  8 Jan 2021 21:10:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F426E8C8
 for <nouveau@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q18so10187724wrn.1
 for <nouveau@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLC3wxlYHWQ6PZsMNQdNLlm9sisuncKTa88XLx3zSUE=;
 b=yAbWapUqHe8VBH9G3KF49EDy/sQO6m+wgwLul50t3CREipW6GSC25Q0XUGNXI+5XDS
 cAMwcDsYmksX5DAN6QjkNeVu+KSWOoBaiMbvkUIXK9OlK14JbvaAtWtCGg8QIHPRyxjV
 e7YVrUJHXqnL8JE6wvQIBqXddGl+TU/O0ne7C55/pIRN5Pw1te6MlvwclqB2a3wyJYxt
 ZSUwUtFgjcXdYIpYfvOCe9W9jeLF6WARUmrw91MnBu2qdIVBQrtRZ5rP43ChK0k87CYf
 Pgj99VtP3blz3INbhrXCSedTTuvz/tA64m63/vAtY0NWtL67rDl7yraJ/QLw0A/4GyhL
 o/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLC3wxlYHWQ6PZsMNQdNLlm9sisuncKTa88XLx3zSUE=;
 b=RDjVhSX2pQVg0fiE/5yFZZ9J5tKpY3nhkHOHXh+jYfvCsYW7APcCOmWplDNSyHSbi8
 GCT18VLYqTUcNpP5nPQiILELve3rMsVASDbKQu/3qUGpMYtyEjZFV6/zuiPsnfvqxzcA
 4lsVa7uPj23mIWNgf7v1nO7LBSvfLdlmqwAW5SrXVkQ7IsvmvFBWcv1AP/km0F9qc+ij
 /A2IW2Hwp/tcadNr0CYfSEmhu/rNBXsZvurOAYY56rk3s71dzXndrBPOFXBt6ydjJ5W1
 rWnWHlcdLV0DdST+UUnpOxQH/GsKaza4vhfyN42kikmJHZxEgF4EePieH3oIyozLSQuM
 /J0A==
X-Gm-Message-State: AOAM5317Y7P/c2vRQjuC8Dd4DM6cRC/iCH5lvHiXMEhHkIwHhU7sKgf2
 Lu+9I/L/kD7SebmtnAe6l26tAQ==
X-Google-Smtp-Source: ABdhPJwQxL1faOPxx3kXmSO23mgrSfY+Szq+BvgRMYG9nDkR7lKbbRKJvC5wf10qTP7Y1M1j0pYTnA==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr5214417wrw.372.1610136907434; 
 Fri, 08 Jan 2021 12:15:07 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri,  8 Jan 2021 20:14:19 +0000
Message-Id: <20210108201457.3078600-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 21:10:28 +0000
Subject: [Nouveau] [PATCH 02/40] drm/nouveau/dispnv50/disp: Remove unused
 variable 'ret'
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEzODE6Njogd2FybmluZzogdmFyaWFi
bGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAzM2ZmZjM4OGRkODNjLi5iNjE1MjA0YzJj
YmE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xMzc4LDEw
ICsxMzc4LDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIHsK
IAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2Uu
YmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0OwogCiAJ
TlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIHByZXBhcmVcbiIsIG1zdG0tPm91dHAtPmJhc2UuYmFz
ZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7
CisJZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwogCiAJZHJtX2Zvcl9l
YWNoX2VuY29kZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewogCQlpZiAo
ZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
