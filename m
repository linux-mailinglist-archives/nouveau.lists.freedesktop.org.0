Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E786DBBD2A
	for <lists+nouveau@lfdr.de>; Mon, 23 Sep 2019 22:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B99789F92;
	Mon, 23 Sep 2019 20:40:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3A089F85
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:05 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0653719D335
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:05 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id z8so5267601wrs.14
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 13:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcGgDUoSBtRHMtTiYTumKxXnLNlHbedxdovbU4UAHyE=;
 b=PDHN11MjRh1csZJNfxNO0O10dl9yM4Jpm1uv8pbg+M0DlNt3/2hng45pltOli2XSgK
 K/NRVWQJb9nMbMFoblWn7CvPSsVQRlmxEMSNbh1aoo2UVzmvN9nWN7A3Zx6gqSbz3ESA
 FfBuPctz95WKoUroyxpqDLirxVR2T7eJGeMzXIFPJVxTelNIBAS1K8S1upntDe7YoTUQ
 /DAkTCQH617hRGmau9YHnD0HuO7iCOgYbQuLMaBU1w0xKPlYY8vg2pFnuvTIHSfdkqTM
 2HiJW+e7g2odtlv93kjLM4GagOF0v5jrQvpV5zTaeCuUEBAYqD8ZN0MnixZN2T/d01Sn
 I+Vg==
X-Gm-Message-State: APjAAAU6PDy2iK2QNYEwh4aMzINFCJqL7J5k+NNrIW2skl8p2pX9dHXv
 b13Yk4NfOsVVE9gKYx8WDP66i/ylUZ3pEcPyYG4IAKXcxuPiJTRpP26nG4aKXq1YOTgas39El1H
 s/w+amrDd+zzRmiOgv2txqCfd7Q==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1041602wmb.65.1569271203504; 
 Mon, 23 Sep 2019 13:40:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNJ6f1gs/DU/Nuk9fmqln9ERz/Qi/9rCAlxBu+h/hKpjqWDsoUb+MxWHMCgoLMQqxmLY9Fkg==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1041596wmb.65.1569271203363; 
 Mon, 23 Sep 2019 13:40:03 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:2d3c:bd88:58b8:6e7c])
 by smtp.gmail.com with ESMTPSA id o9sm21912918wrh.46.2019.09.23.13.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 13:40:02 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 23 Sep 2019 22:39:48 +0200
Message-Id: <20190923203951.1652-6-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923203951.1652-1-kherbst@redhat.com>
References: <20190923203951.1652-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 5/8] drm: set power_state to
 DRM_SWITCH_POWER_CHANGING before changing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

LS0tCiBkcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgYi9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCmluZGV4IDNkMzJhZmU4YS4uNDY2MjcxYzBjIDEwMDY0
NAotLS0gYS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCisrKyBiL2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJtLmMKQEAgLTkxNyw2ICs5MTcsNyBAQCBub3V2ZWF1X3Btb3BzX3J1bnRpbWVfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiAtRUJVU1k7CiAJfQogCisJZHJtX2Rldi0+
c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9DSEFOR0lORzsKIAlub3V2ZWF1
X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKIAlyZXQgPSBub3V2ZWF1X2RvX3N1c3BlbmQoZHJt
X2RldiwgdHJ1ZSk7CiAJcGNpX3NhdmVfc3RhdGUocGRldik7CkBAIC05NDEsNiArOTQyLDcgQEAg
bm91dmVhdV9wbW9wc19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVy
biAtRUJVU1k7CiAJfQogCisJZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRD
SF9QT1dFUl9DSEFOR0lORzsKIAlwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9EMCk7CiAJ
cGNpX3Jlc3RvcmVfc3RhdGUocGRldik7CiAJcmV0ID0gcGNpX2VuYWJsZV9kZXZpY2UocGRldik7
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
