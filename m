Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2922B14AA
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 21:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309456EE00;
	Thu, 12 Sep 2019 19:00:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9246EDFF
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:39 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3CAA3DE31
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:38 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id r21so28390wme.5
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 12:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PVd3+f6O4b7NcpwGszEaJtw+1HWbHrJjp3XkWV26U6A=;
 b=Rzs0lqPyLlpnx1prIMfWEAgI8jvsZub5g+OQNF6dNBI9qPUM1Fa+WPxcetUlU0vAuj
 bAK8HKQhI7rQurkHsM9RAhNz2C7JmVNGMSavnsyh9EgbKKg56W13wdZHvKv3vZYX8IbB
 HjxC6f/zv3v5eYf60GPKPGkDbaSlkYJFIPGli/OVMYxNF6zVXQeK9uPFEDUaa+KDUg9g
 HCpXPKsZdYaC0MyeXacPs2+2RIm/nmTcrhwsG5weQ+VuLdz+xnImdpllnYdnqoqT0UPD
 oVTZrYYVYIiWF0MZ03Gziy7tYSY/32qBCUgOfNUK22C7gaZCH71xl0pbNSQWqkDsBkpk
 4o2Q==
X-Gm-Message-State: APjAAAV13V+PFACY/HyP8lutXHlhxod8I0W5PcC0GejFvNjWO3GC/9QH
 Kfdyy1ubb3diUDb8TplGfwAs4CxDZkLaYXlTA2tJPk4LO5fefPh9pvfR9A49gbmPTGipHJDf/Oc
 uNBp5dN+eF4P3e2l3EyKqg9eFnw==
X-Received: by 2002:adf:f081:: with SMTP id n1mr7756159wro.273.1568314837414; 
 Thu, 12 Sep 2019 12:00:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwq6nLpMqNRsBNq5JBZJZhZ/U1OnPwpyAtJG3SMWnAPFGRuUskg3oRsgN78LaldRbTPYsKAkA==
X-Received: by 2002:adf:f081:: with SMTP id n1mr7756146wro.273.1568314837261; 
 Thu, 12 Sep 2019 12:00:37 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:f075:99ad:7efe:778d])
 by smtp.gmail.com with ESMTPSA id i9sm34104426wrb.18.2019.09.12.12.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 12:00:36 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 12 Sep 2019 21:00:28 +0200
Message-Id: <20190912190028.27977-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912190028.27977-1-kherbst@redhat.com>
References: <20190912190028.27977-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 3/3] pci/gk104: wait for ltssm idle before
 changing the link
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

dGFrZW4gZnJvbSBudmdwdQoKU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L3BjaS9nazEwNC5jCmluZGV4IDZhZWIwN2ZlNC4uMmQxZmE2N2ViIDEwMDY0NAotLS0gYS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvZ2sxMDQuYwpAQCAtMjMsNiArMjMsOCBAQAogICovCiAjaW5jbHVkZSAicHJpdi5o
IgogCisjaW5jbHVkZSA8c3ViZGV2L3RpbWVyLmg+CisKIHN0YXRpYyBpbnQKIGdrMTA0X3BjaWVf
dmVyc2lvbl9zdXBwb3J0ZWQoc3RydWN0IG52a21fcGNpICpwY2kpCiB7CkBAIC0xNDIsNiArMTQ0
LDExIEBAIGdrMTA0X3BjaWVfc2V0X2xpbmtfc3BlZWQoc3RydWN0IG52a21fcGNpICpwY2ksIGVu
dW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkKQogCQlicmVhazsKIAl9CiAKKwkvKiB3YWl0IGZvciBs
dHNzbSBpZGxlICovCisJbnZrbV9tc2VjKGRldmljZSwgMjAwLAorCQlpZiAoKG52a21fcmQzMihk
ZXZpY2UsIDB4OGMwNDApICYgMHgxZikgPT0gMCkKKwkJCWJyZWFrOworCSk7CiAJbnZrbV9tYXNr
KGRldmljZSwgMHg4YzA0MCwgMHhjMDAwMCwgbWFza192YWx1ZSk7CiAJbnZrbV9tYXNrKGRldmlj
ZSwgMHg4YzA0MCwgMHgxLCAweDEpOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
