Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D725E65932
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB52F6E25B;
	Thu, 11 Jul 2019 14:42:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADD26E258
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:18:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w9so7094553wmd.1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 07:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=forXDOAiuYHswzwe/sWUbMfTNNMovby1HTWVkCE5bqw=;
 b=Av3d7oTPT1Dtum95L/Bl/ZgpCRVVJwiMWa+103cDGuGOAtnPsZAQeGb3KXkJ1dK3mc
 mWdMBqwwpNYq4fBl1xUmMtMEB5m3W1DoGek2KF1/DnO3ZuSLa+29OWokKo3O73l4PD+z
 cfIumV79msLILqqDujTgUvdye+q9d3RycW4iarSnxSgDklmauZqn7GRb+pv75bNEcTZu
 3U4EuHMwKHzD3V364YKs1jChhsTux66B9i5JOCHPthhCzX9qXR908uhDkt9KZy412B+X
 3umlFw3IZSFY53qVjNDmH4MKwEQI0SPyX3yW0vmBq+a6zJHOOZlkKBmdVsD8FOcrvyMG
 wrTQ==
X-Gm-Message-State: APjAAAX1DqC7PKC9U5dCcVfq9xs+nHKa6NxM28mfDmQHnP7b3PehgAm9
 BFr1I1K8wznpiJwXyH5z4o2vdCTIwVI=
X-Google-Smtp-Source: APXvYqyft/WDERTboYt/XRaoIP8QXna5Yg6ceu58mD9h+Sx7dqqccVFIc94MiWyz3m1ZfT/z3ZBztQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr4695759wma.41.1562854710179; 
 Thu, 11 Jul 2019 07:18:30 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 5sm5883635wmg.42.2019.07.11.07.18.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 07:18:29 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 16:11:53 +0200
Message-Id: <20190711141153.7723-5-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711141153.7723-1-mmenzyns@redhat.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 14:42:17 +0000
Subject: [Nouveau] [PATCH 4/4] gpio: added power check for another GPIO
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

dGhpcyBvbmUgaXMgbWFpbmx5IHVzZWQgb24gVGVzbGEgYW5kIHNvbXRpbWVzIG9uIEZlcm1pIEdQ
VXMKCnVudGVzdGVkLCB3cm90ZSBhY2NvcmRpbmcgdG8gZG9jdW1lbnRhdGlvbgoKU2lnbmVkLW9m
Zi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZl
YXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCB8IDEgKwogZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZ3Bpby9iYXNlLmMgICAgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2
L2Jpb3MvZ3Bpby5oIGIvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8u
aAppbmRleCBmYzJiNWZiMC4uNzg0YzVmMjIgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L2luY2x1
ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKKysrIGIvZHJtL25vdXZlYXUvaW5jbHVkZS9udmtt
L3N1YmRldi9iaW9zL2dwaW8uaApAQCAtOCw2ICs4LDcgQEAgZW51bSBkY2JfZ3Bpb19mdW5jX25h
bWUgewogCURDQl9HUElPX1RIRVJNX0VYVF9QT1dFUl9FVkVOVCA9IDB4MTAsCiAJRENCX0dQSU9f
VFZEQUMxID0gMHgyZCwKIAlEQ0JfR1BJT19GQU5fU0VOU0UgPSAweDNkLAorCURDQl9HUElPX1BP
V0VSX0FMRVJUID0gMHg0YywKIAlEQ0JfR1BJT19FWFRfUE9XRVJfTE9XID0gMHg3OSwKIAlEQ0Jf
R1BJT19MT0dPX0xFRF9QV00gPSAweDg0LAogCURDQl9HUElPX1VOVVNFRCA9IDB4ZmYsCmRpZmYg
LS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYyBiL2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCmluZGV4IDBjODg2NTQzLi43NTVmMDE2ZiAxMDA2NDQK
LS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMKKysrIGIvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMKQEAgLTE4NCw2ICsxODQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgZ3Bpb19yZXNldF9pZHNbXSA9IHsKIAogc3RhdGljIGVu
dW0gZGNiX2dwaW9fZnVuY19uYW1lIHBvd2VyX2NoZWNrc1tdID0gewogCURDQl9HUElPX1RIRVJN
X0VYVF9QT1dFUl9FVkVOVCwKKwlEQ0JfR1BJT19QT1dFUl9BTEVSVCwKIAlEQ0JfR1BJT19FWFRf
UE9XRVJfTE9XLAogfTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
