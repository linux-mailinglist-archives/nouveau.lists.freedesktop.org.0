Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4874B01C4
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 02:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB310E73B;
	Thu, 10 Feb 2022 01:00:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 09 Feb 2022 06:59:00 UTC
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2258310E364;
 Wed,  9 Feb 2022 06:59:00 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1644389631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pUlfTRQkrTdTQFBKHqDRrCVlXpII0vP2L2obohCfw1o=;
 b=KS5D3kMy2jy60z6MS+GNQCgowsvHdb2pMuA/hNuwvbeJuI0PaK1fHQcATmDtYJvCrwVPdN
 0GKbm3QiiKjUgdx/M0lJlcRcCFxmZcKKjNMYPwLhUMvLLNGB9II1ZG1CLeSQete0Qw7YFE
 Fy/dccLiu4yT+06N70lvVn3J2uwLVDc=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Date: Wed,  9 Feb 2022 14:53:19 +0800
Message-Id: <20220209065322.43938-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Mailman-Approved-At: Thu, 10 Feb 2022 01:00:19 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Remove the unused header file
 nvif/list.h
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The nouveau driver depends on include/linux/list.h instead of
nvif/list.h, so remove the obstacle-nvif/list.h.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/nouveau/include/nvif/list.h | 353 --------------------
 1 file changed, 353 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/list.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/list.h b/drivers/gpu/drm/nouveau/include/nvif/list.h
deleted file mode 100644
index 8af5d144ecb0..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/list.h
+++ /dev/null
@@ -1,353 +0,0 @@
-/*
- * Copyright © 2010 Intel Corporation
- * Copyright © 2010 Francisco Jerez <currojerez@riseup.net>
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
- */
-
-/* Modified by Ben Skeggs <bskeggs@redhat.com> to match kernel list APIs */
-
-#ifndef _XORG_LIST_H_
-#define _XORG_LIST_H_
-
-/**
- * @file Classic doubly-link circular list implementation.
- * For real usage examples of the linked list, see the file test/list.c
- *
- * Example:
- * We need to keep a list of struct foo in the parent struct bar, i.e. what
- * we want is something like this.
- *
- *     struct bar {
- *          ...
- *          struct foo *list_of_foos; -----> struct foo {}, struct foo {}, struct foo{}
- *          ...
- *     }
- *
- * We need one list head in bar and a list element in all list_of_foos (both are of
- * data type 'struct list_head').
- *
- *     struct bar {
- *          ...
- *          struct list_head list_of_foos;
- *          ...
- *     }
- *
- *     struct foo {
- *          ...
- *          struct list_head entry;
- *          ...
- *     }
- *
- * Now we initialize the list head:
- *
- *     struct bar bar;
- *     ...
- *     INIT_LIST_HEAD(&bar.list_of_foos);
- *
- * Then we create the first element and add it to this list:
- *
- *     struct foo *foo = malloc(...);
- *     ....
- *     list_add(&foo->entry, &bar.list_of_foos);
- *
- * Repeat the above for each element you want to add to the list. Deleting
- * works with the element itself.
- *      list_del(&foo->entry);
- *      free(foo);
- *
- * Note: calling list_del(&bar.list_of_foos) will set bar.list_of_foos to an empty
- * list again.
- *
- * Looping through the list requires a 'struct foo' as iterator and the
- * name of the field the subnodes use.
- *
- * struct foo *iterator;
- * list_for_each_entry(iterator, &bar.list_of_foos, entry) {
- *      if (iterator->something == ...)
- *             ...
- * }
- *
- * Note: You must not call list_del() on the iterator if you continue the
- * loop. You need to run the safe for-each loop instead:
- *
- * struct foo *iterator, *next;
- * list_for_each_entry_safe(iterator, next, &bar.list_of_foos, entry) {
- *      if (...)
- *              list_del(&iterator->entry);
- * }
- *
- */
-
-/**
- * The linkage struct for list nodes. This struct must be part of your
- * to-be-linked struct. struct list_head is required for both the head of the
- * list and for each list node.
- *
- * Position and name of the struct list_head field is irrelevant.
- * There are no requirements that elements of a list are of the same type.
- * There are no requirements for a list head, any struct list_head can be a list
- * head.
- */
-struct list_head {
-    struct list_head *next, *prev;
-};
-
-/**
- * Initialize the list as an empty list.
- *
- * Example:
- * INIT_LIST_HEAD(&bar->list_of_foos);
- *
- * @param The list to initialized.
- */
-#define LIST_HEAD_INIT(name) { &(name), &(name) }
-
-#define LIST_HEAD(name) \
-	struct list_head name = LIST_HEAD_INIT(name)
-
-static inline void
-INIT_LIST_HEAD(struct list_head *list)
-{
-    list->next = list->prev = list;
-}
-
-static inline void
-__list_add(struct list_head *entry,
-                struct list_head *prev, struct list_head *next)
-{
-    next->prev = entry;
-    entry->next = next;
-    entry->prev = prev;
-    prev->next = entry;
-}
-
-/**
- * Insert a new element after the given list head. The new element does not
- * need to be initialised as empty list.
- * The list changes from:
- *      head → some element → ...
- * to
- *      head → new element → older element → ...
- *
- * Example:
- * struct foo *newfoo = malloc(...);
- * list_add(&newfoo->entry, &bar->list_of_foos);
- *
- * @param entry The new element to prepend to the list.
- * @param head The existing list.
- */
-static inline void
-list_add(struct list_head *entry, struct list_head *head)
-{
-    __list_add(entry, head, head->next);
-}
-
-/**
- * Append a new element to the end of the list given with this list head.
- *
- * The list changes from:
- *      head → some element → ... → lastelement
- * to
- *      head → some element → ... → lastelement → new element
- *
- * Example:
- * struct foo *newfoo = malloc(...);
- * list_add_tail(&newfoo->entry, &bar->list_of_foos);
- *
- * @param entry The new element to prepend to the list.
- * @param head The existing list.
- */
-static inline void
-list_add_tail(struct list_head *entry, struct list_head *head)
-{
-    __list_add(entry, head->prev, head);
-}
-
-static inline void
-__list_del(struct list_head *prev, struct list_head *next)
-{
-    next->prev = prev;
-    prev->next = next;
-}
-
-/**
- * Remove the element from the list it is in. Using this function will reset
- * the pointers to/from this element so it is removed from the list. It does
- * NOT free the element itself or manipulate it otherwise.
- *
- * Using list_del on a pure list head (like in the example at the top of
- * this file) will NOT remove the first element from
- * the list but rather reset the list as empty list.
- *
- * Example:
- * list_del(&foo->entry);
- *
- * @param entry The element to remove.
- */
-static inline void
-list_del(struct list_head *entry)
-{
-    __list_del(entry->prev, entry->next);
-}
-
-static inline void
-list_del_init(struct list_head *entry)
-{
-    __list_del(entry->prev, entry->next);
-    INIT_LIST_HEAD(entry);
-}
-
-static inline void list_move_tail(struct list_head *list,
-				  struct list_head *head)
-{
-	__list_del(list->prev, list->next);
-	list_add_tail(list, head);
-}
-
-/**
- * Check if the list is empty.
- *
- * Example:
- * list_empty(&bar->list_of_foos);
- *
- * @return True if the list contains one or more elements or False otherwise.
- */
-static inline bool
-list_empty(struct list_head *head)
-{
-    return head->next == head;
-}
-
-/**
- * Returns a pointer to the container of this list element.
- *
- * Example:
- * struct foo* f;
- * f = container_of(&foo->entry, struct foo, entry);
- * assert(f == foo);
- *
- * @param ptr Pointer to the struct list_head.
- * @param type Data type of the list element.
- * @param member Member name of the struct list_head field in the list element.
- * @return A pointer to the data struct containing the list head.
- */
-#ifndef container_of
-#define container_of(ptr, type, member) \
-    (type *)((char *)(ptr) - (char *) &((type *)0)->member)
-#endif
-
-/**
- * Alias of container_of
- */
-#define list_entry(ptr, type, member) \
-    container_of(ptr, type, member)
-
-/**
- * Retrieve the first list entry for the given list pointer.
- *
- * Example:
- * struct foo *first;
- * first = list_first_entry(&bar->list_of_foos, struct foo, list_of_foos);
- *
- * @param ptr The list head
- * @param type Data type of the list element to retrieve
- * @param member Member name of the struct list_head field in the list element.
- * @return A pointer to the first list element.
- */
-#define list_first_entry(ptr, type, member) \
-    list_entry((ptr)->next, type, member)
-
-/**
- * Retrieve the last list entry for the given listpointer.
- *
- * Example:
- * struct foo *first;
- * first = list_last_entry(&bar->list_of_foos, struct foo, list_of_foos);
- *
- * @param ptr The list head
- * @param type Data type of the list element to retrieve
- * @param member Member name of the struct list_head field in the list element.
- * @return A pointer to the last list element.
- */
-#define list_last_entry(ptr, type, member) \
-    list_entry((ptr)->prev, type, member)
-
-#define __container_of(ptr, sample, member)				\
-    (void *)container_of((ptr), typeof(*(sample)), member)
-
-/**
- * Loop through the list given by head and set pos to struct in the list.
- *
- * Example:
- * struct foo *iterator;
- * list_for_each_entry(iterator, &bar->list_of_foos, entry) {
- *      [modify iterator]
- * }
- *
- * This macro is not safe for node deletion. Use list_for_each_entry_safe
- * instead.
- *
- * @param pos Iterator variable of the type of the list elements.
- * @param head List head
- * @param member Member name of the struct list_head in the list elements.
- *
- */
-#define list_for_each_entry(pos, head, member)				\
-    for (pos = __container_of((head)->next, pos, member);		\
-	 &pos->member != (head);					\
-	 pos = __container_of(pos->member.next, pos, member))
-
-/**
- * Loop through the list, keeping a backup pointer to the element. This
- * macro allows for the deletion of a list element while looping through the
- * list.
- *
- * See list_for_each_entry for more details.
- */
-#define list_for_each_entry_safe(pos, tmp, head, member)		\
-    for (pos = __container_of((head)->next, pos, member),		\
-	 tmp = __container_of(pos->member.next, pos, member);		\
-	 &pos->member != (head);					\
-	 pos = tmp, tmp = __container_of(pos->member.next, tmp, member))
-
-
-#define list_for_each_entry_reverse(pos, head, member)			\
-	for (pos = __container_of((head)->prev, pos, member);		\
-	     &pos->member != (head);					\
-	     pos = __container_of(pos->member.prev, pos, member))
-
-#define list_for_each_entry_continue(pos, head, member)			\
-	for (pos = __container_of(pos->member.next, pos, member);	\
-	     &pos->member != (head);					\
-	     pos = __container_of(pos->member.next, pos, member))
-
-#define list_for_each_entry_continue_reverse(pos, head, member)		\
-	for (pos = __container_of(pos->member.prev, pos, member);	\
-	     &pos->member != (head);					\
-	     pos = __container_of(pos->member.prev, pos, member))
-
-#define list_for_each_entry_from(pos, head, member)			\
-	for (;								\
-	     &pos->member != (head);					\
-	     pos = __container_of(pos->member.next, pos, member))
-
-#endif
-- 
2.25.1

