Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D58B3FC
	for <lists+nouveau@lfdr.de>; Tue, 13 Aug 2019 11:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2E96E0C1;
	Tue, 13 Aug 2019 09:20:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2AC6E0C1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 09:20:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f72so802901wmf.5
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 02:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzXAzISLScJmDGfZPy4lNTovcD0IucleaK/rIkCZ1h4=;
 b=s3hX9a+GBK787mEgzL26eG6C7ss0RySe8t1ayTXOk2wOj0DZgIN24CzVAZg6eFYIWK
 FbIh5RWbde7AzBPWfmCQZEg76QW1bazIXq8OlECWVzqlMRoSePhaWlFSEVvCex1wRU0L
 wiIaa3865LnZa2m8OZUNo9klECUq4fTerj70s+Fra0eAIL2fHGR/Xi/OpXPRPFhqKMod
 TV4+Ph4K/qABvqs+bjf1W8jxdmB4Eu46mNqB306OcJNjuHkILJKDsu5R8k5NdaAm3VJU
 hP/y7rMtOoBfgtJ9dpS8GdyTyciQT9nQRalEBdgKOGjBsFUs74pEVUpS8XG2rBpT/Qw3
 lcvg==
X-Gm-Message-State: APjAAAXKvoIYFKYs7oKrmKzab+OUBW0h9xBTEY3PwtMJwHUS53BBcWu7
 V0FRxsSLbmqJysDP68OoHbtFyaPs2JovpQ==
X-Google-Smtp-Source: APXvYqzi1rHsWBdLmIive52/8xqSSPWlYevgngZzl5m3sp/0w/Xi3k0DFV2bTlUOzsD4JlLJyoOrCA==
X-Received: by 2002:a1c:c78d:: with SMTP id x135mr1998936wmf.82.1565688005341; 
 Tue, 13 Aug 2019 02:20:05 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id s64sm1525414wmf.16.2019.08.13.02.20.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:20:04 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 13 Aug 2019 11:19:57 +0200
Message-Id: <20190813091957.4812-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813091957.4812-1-kherbst@redhat.com>
References: <20190813091957.4812-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 4/4] drm: abort runtime suspend if we hit an error
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

LS0tCiBkcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMg
Yi9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCmluZGV4IDc4ZDU1YzUyNS4uNmE2ODE5ZDk2IDEw
MDY0NAotLS0gYS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCisrKyBiL2RybS9ub3V2ZWF1L25v
dXZlYXVfZHJtLmMKQEAgLTkxMSw2ICs5MTEsNyBAQCBub3V2ZWF1X3Btb3BzX3J1bnRpbWVfc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19w
Y2lfZGV2KGRldik7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRh
dGEocGRldik7CisJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShkcm1fZGV2
KTsKIAlpbnQgcmV0OwogCiAJaWYgKCFub3V2ZWF1X3Btb3BzX3J1bnRpbWUoKSkgewpAQCAtOTIw
LDYgKzkyMSwxMCBAQCBub3V2ZWF1X3Btb3BzX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIAlub3V2ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKIAlyZXQgPSBub3V2
ZWF1X2RvX3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7CisJaWYgKHJldCkgeworCQlOVl9FUlJPUihk
cm0sICJzdXNwZW5kIGZhaWxlZCB3aXRoOiAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9
CiAJcGNpX3NhdmVfc3RhdGUocGRldik7CiAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwogCXBj
aV9pZ25vcmVfaG90cGx1ZyhwZGV2KTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
