Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450E13B2B
	for <lists+nouveau@lfdr.de>; Sat,  4 May 2019 18:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B475F893CD;
	Sat,  4 May 2019 16:32:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A71893A8
 for <nouveau@lists.freedesktop.org>; Sat,  4 May 2019 16:32:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y2so10307322wmi.5
 for <nouveau@lists.freedesktop.org>; Sat, 04 May 2019 09:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSyuramQNKQw7VinZWituF2jUYNjWgmhgvD1XNQWovw=;
 b=cLnE1oUYdmqfDT0V2lYdmXvW2Qt6/loESIdOdVDfC4nv/YCzTDnI9u1ZpQ9CxR8GqB
 1CoNUDXVCRBPagTvZfnTfEHMR51I9tgejVVNqO0rKz4HL8l9ZMuEsIRSN9uUmk1vgv7y
 VuX3lICdVDjHTa+oz6r/a8kapuyFZrtthKynNf1mNmCwX4oUdq/zqGyQF2hwbGKLrO8r
 12cJ5GTFp9g0NlMATnW9UheS0FdoyfPX9tgFrSSm4plnrysFarA4Wd6OjVroN81sjLK6
 vmoH4P92AZuP/9rCIxTKD2JSwBrmitVi+Jw8NjuFpZdb+a152NZaZkA+tw/iLHqUzslv
 /mhg==
X-Gm-Message-State: APjAAAUgMoNPj8/2g2TeH7A5gRxVrK0jWY4t5OqjZ2Dy+J05oSQy5XN7
 HVoziLLx5kiSjkRRIXRpwXXpvz5FosI=
X-Google-Smtp-Source: APXvYqw+W1er07C0K+VTZXhoTgt5/xzQ9j1EXxsTpmGsUOY+6LTW4/yh6vACNJduzPmOYgc++r5nmw==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr4119877wmc.36.1556987548305; 
 Sat, 04 May 2019 09:32:28 -0700 (PDT)
Received: from kherbst.pingu ([2a02:8308:b0be:6900:3cb7:ac97:41a7:519d])
 by smtp.gmail.com with ESMTPSA id z17sm3824707wrm.33.2019.05.04.09.32.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 May 2019 09:32:27 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Sat,  4 May 2019 18:32:17 +0200
Message-Id: <20190504163219.8349-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504163219.8349-1-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 3/5] pci: add nvkm_pcie_get_speed
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

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Ci0tLQogZHJt
L25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCB8IDEgKwogZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRl
di9wY2kuaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKaW5kZXggMjM4
MDNjYzguLjFmZGYzMDk4IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3Vi
ZGV2L3BjaS5oCisrKyBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKQEAg
LTUzLDQgKzUzLDUgQEAgaW50IGdwMTAwX3BjaV9uZXcoc3RydWN0IG52a21fZGV2aWNlICosIGlu
dCwgc3RydWN0IG52a21fcGNpICoqKTsKIAogLyogcGNpZSBmdW5jdGlvbnMgKi8KIGludCBudmtt
X3BjaWVfc2V0X2xpbmsoc3RydWN0IG52a21fcGNpICosIGVudW0gbnZrbV9wY2llX3NwZWVkLCB1
OCB3aWR0aCk7CitlbnVtIG52a21fcGNpZV9zcGVlZCBudmttX3BjaWVfZ2V0X3NwZWVkKHN0cnVj
dCBudmttX3BjaSAqKTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvcGNpL3BjaWUuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMKaW5kZXgg
ZDcxZTVkYjUuLmViNDA1ZGVhIDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvcGNpZS5jCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMKQEAgLTE2
MywzICsxNjMsMTEgQEAgbnZrbV9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBl
bnVtIG52a21fcGNpZV9zcGVlZCBzcGVlZCwgdTggd2lkdGgpCiAKIAlyZXR1cm4gcmV0OwogfQor
CitlbnVtIG52a21fcGNpZV9zcGVlZAorbnZrbV9wY2llX2dldF9zcGVlZChzdHJ1Y3QgbnZrbV9w
Y2kgKnBjaSkKK3sKKwlpZiAoIXBjaSB8fCAhcGNpX2lzX3BjaWUocGNpLT5wZGV2KSB8fCAhcGNp
LT5wY2llLmN1cl9zcGVlZCkKKwkJcmV0dXJuIC1FTk9TWVM7CisJcmV0dXJuIHBjaS0+ZnVuYy0+
cGNpZS5jdXJfc3BlZWQocGNpKTsKK30KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
